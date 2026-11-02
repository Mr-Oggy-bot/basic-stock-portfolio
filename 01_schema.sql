SET DEFINE OFF;
CREATE TABLE investor (
    investor_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    email VARCHAR2(60) UNIQUE NOT NULL,
    phone VARCHAR2(15) UNIQUE,
    dob DATE,
    pan_no VARCHAR2(15) UNIQUE NOT NULL
);
CREATE TABLE stock (
    stock_id NUMBER PRIMARY KEY,
    symbol VARCHAR2(10) UNIQUE NOT NULL,
    stock_name VARCHAR2(60) NOT NULL,
    sector VARCHAR2(30),
    current_price NUMBER(12,2) CHECK (current_price > 0)
);
CREATE TABLE portfolio (
    portfolio_id NUMBER PRIMARY KEY,
    investor_id NUMBER UNIQUE,
    portfolio_name VARCHAR2(50),
    created_date DATE DEFAULT SYSDATE,
    FOREIGN KEY (investor_id) REFERENCES investor(investor_id)
);
CREATE TABLE trade_transactions (
    trans_id NUMBER PRIMARY KEY,
    investor_id NUMBER,
    stock_id NUMBER,
    portfolio_id NUMBER,
    trans_type VARCHAR2(10) CHECK (trans_type IN ('BUY','SELL')),
    quantity NUMBER CHECK (quantity > 0),
    price NUMBER(12,2) CHECK (price > 0),
    trans_date DATE DEFAULT SYSDATE,

    FOREIGN KEY (investor_id) REFERENCES investor(investor_id),
    FOREIGN KEY (stock_id) REFERENCES stock(stock_id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(portfolio_id)
);
CREATE TABLE holdings (
    holding_id NUMBER PRIMARY KEY,
    portfolio_id NUMBER,
    stock_id NUMBER,
    total_quantity NUMBER DEFAULT 0 CHECK (total_quantity >= 0),
    avg_buy_price NUMBER(12,2),

    FOREIGN KEY (portfolio_id) REFERENCES portfolio(portfolio_id),
    FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
);
CREATE TABLE profit_loss_report (
    report_id NUMBER PRIMARY KEY,
    investor_id NUMBER,
    stock_id NUMBER,
    total_profit NUMBER(12,2) DEFAULT 0,
    total_loss NUMBER(12,2) DEFAULT 0,

    FOREIGN KEY (investor_id) REFERENCES investor(investor_id),
    FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
);
CREATE TABLE admin_log (
    log_id NUMBER PRIMARY KEY,
    action_desc VARCHAR2(200),
    log_time DATE DEFAULT SYSDATE
);
SELECT table_name FROM user_tables;