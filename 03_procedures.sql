--PL/SQL
--Buy Stock Procedure
CREATE OR REPLACE PROCEDURE buy_stock(
    p_trans_id NUMBER,
    p_investor_id NUMBER,
    p_stock_id NUMBER,
    p_portfolio_id NUMBER,
    p_qty NUMBER
)
IS
    v_price NUMBER;
BEGIN
    SELECT current_price INTO v_price
    FROM stock
    WHERE stock_id = p_stock_id;

    INSERT INTO trade_transactions
    VALUES (
        p_trans_id,
        p_investor_id,
        p_stock_id,
        p_portfolio_id,
        'BUY',
        p_qty,
        v_price,
        SYSDATE
    );

    DBMS_OUTPUT.PUT_LINE('BUY ORDER SUCCESSFUL');
END;
/

--Sell Stock Procedure
CREATE OR REPLACE PROCEDURE sell_stock(
    p_trans_id NUMBER,
    p_investor_id NUMBER,
    p_stock_id NUMBER,
    p_portfolio_id NUMBER,
    p_qty NUMBER
)
IS
    v_price NUMBER;
BEGIN
    SELECT current_price INTO v_price
    FROM stock
    WHERE stock_id = p_stock_id;

    INSERT INTO trade_transactions
    VALUES (
        p_trans_id,
        p_investor_id,
        p_stock_id,
        p_portfolio_id,
        'SELL',
        p_qty,
        v_price,
        SYSDATE
    );

    DBMS_OUTPUT.PUT_LINE('SELL ORDER SUCCESSFUL');
END;
/

--Cursor Report
CREATE OR REPLACE PROCEDURE portfolio_report
IS
    CURSOR c1 IS
    SELECT p.portfolio_name,
           i.name
    FROM portfolio p
    JOIN investor i
      ON p.investor_id = i.investor_id;

BEGIN
    FOR rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE(rec.name || ' -> ' || rec.portfolio_name);
    END LOOP;
END;
/