--Trigger to Update Holdings After By/Sell
CREATE OR REPLACE TRIGGER trg_update_holdings
AFTER INSERT ON trade_transactions
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM holdings
    WHERE portfolio_id = :NEW.portfolio_id
      AND stock_id = :NEW.stock_id;

    IF :NEW.trans_type = 'BUY' THEN

        IF v_count = 0 THEN
            INSERT INTO holdings
            VALUES (
                holdings_seq.NEXTVAL,
                :NEW.portfolio_id,
                :NEW.stock_id,
                :NEW.quantity,
                :NEW.price
            );
        ELSE
            UPDATE holdings
            SET total_quantity = total_quantity + :NEW.quantity
            WHERE portfolio_id = :NEW.portfolio_id
              AND stock_id = :NEW.stock_id;
        END IF;

    ELSIF :NEW.trans_type = 'SELL' THEN

        UPDATE holdings
        SET total_quantity = total_quantity - :NEW.quantity
        WHERE portfolio_id = :NEW.portfolio_id
          AND stock_id = :NEW.stock_id;

    END IF;
END;
/

--Creating the sequence for holding ids
CREATE SEQUENCE holdings_seq START WITH 100 INCREMENT BY 1;

--Prevent overselling Trigger
CREATE OR REPLACE TRIGGER trg_check_sell
BEFORE INSERT ON trade_transactions
FOR EACH ROW
DECLARE
    v_qty NUMBER;
BEGIN
    IF :NEW.trans_type = 'SELL' THEN

        SELECT total_quantity
        INTO v_qty
        FROM holdings
        WHERE portfolio_id = :NEW.portfolio_id
          AND stock_id = :NEW.stock_id;

        IF v_qty < :NEW.quantity THEN
            RAISE_APPLICATION_ERROR(-20001,'Not enough shares to sell');
        END IF;

    END IF;
END;
/

--Admin Log Trigger
CREATE OR REPLACE TRIGGER trg_log_trade
AFTER INSERT ON trade_transactions
FOR EACH ROW
BEGIN
    INSERT INTO admin_log
    VALUES (
        admin_seq.NEXTVAL,
        'New ' || :NEW.trans_type || ' Transaction by Investor ' || :NEW.investor_id,
        SYSDATE
    );
END;
/

CREATE SEQUENCE admin_seq START WITH 1;



EXEC buy_stock(1001,101,1,201,3);
EXEC sell_stock(1002,101,1,201,2);
SELECT get_portfolio_value(201) FROM dual;
EXEC portfolio_report;