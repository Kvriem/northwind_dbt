
-- -----------------------------------------------------
-- Table customers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.customer (
    id BIGINT,
    company TEXT,
    last_name TEXT,
    first_name TEXT,
    email_address TEXT,
    job_title TEXT,
    business_phone TEXT,
    home_phone TEXT,
    mobile_phone TEXT,
    fax_number TEXT,
    address TEXT,
    city TEXT,
    state_province TEXT,
    zip_postal_code TEXT,
    country_region TEXT,
    web_page TEXT,
    notes TEXT,
    attachments TEXT
);

-- -----------------------------------------------------
-- Table employees
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.employees (
    id BIGINT,
    company TEXT,
    last_name TEXT,
    first_name TEXT,
    email_address TEXT,
    job_title TEXT,
    business_phone TEXT,
    home_phone TEXT,
    mobile_phone TEXT,
    fax_number TEXT,
    address TEXT,
    city TEXT,
    state_province TEXT,
    zip_postal_code TEXT,
    country_region TEXT,
    web_page TEXT,
    notes TEXT,
    attachments TEXT
);

-- -----------------------------------------------------
-- Table privileges
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.privileges (
    id BIGINT,
    privilege_name TEXT
);

-- -----------------------------------------------------
-- Table employee_privileges
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.employee_privileges (
    employee_id BIGINT,
    privilege_id BIGINT
);

-- -----------------------------------------------------
-- Table inventory_transaction_types
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.inventory_transaction_types (
    id BIGINT,
    type_name TEXT
);

-- -----------------------------------------------------
-- Table shippers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.shippers (
    id BIGINT,
    company TEXT,
    last_name TEXT,
    first_name TEXT,
    email_address TEXT,
    job_title TEXT,
    business_phone TEXT,
    home_phone TEXT,
    mobile_phone TEXT,
    fax_number TEXT,
    address TEXT,
    city TEXT,
    state_province TEXT,
    zip_postal_code TEXT,
    country_region TEXT,
    web_page TEXT,
    notes TEXT,
    attachments TEXT
);

-- -----------------------------------------------------
-- Table orders_tax_status
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.orders_tax_status (
    id BIGINT,
    tax_status_name TEXT
);

-- -----------------------------------------------------
-- Table orders_status
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.orders_status (
    id BIGINT,
    status_name TEXT
);

-- -----------------------------------------------------
-- Table orders
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.orders (
    id BIGINT,
    employee_id BIGINT,
    customer_id BIGINT,
    order_date TIMESTAMP,
    shipped_date TIMESTAMP,
    shipper_id BIGINT,
    ship_name TEXT,
    ship_address TEXT,
    ship_city TEXT,
    ship_state_province TEXT,
    ship_zip_postal_code TEXT,
    ship_country_region TEXT,
    shipping_fee DOUBLE PRECISION,
    taxes DOUBLE PRECISION,
    payment_type TEXT,
    paid_date TIMESTAMP,
    notes TEXT,
    tax_rate DOUBLE PRECISION,
    tax_status_id BIGINT,
    status_id BIGINT
);

-- -----------------------------------------------------
-- Table products
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.products (
    supplier_ids TEXT,
    id BIGINT,
    product_code TEXT,
    product_name TEXT,
    description TEXT,
    standard_cost DOUBLE PRECISION,
    list_price DOUBLE PRECISION,
    reorder_level BIGINT,
    target_level BIGINT,
    quantity_per_unit TEXT,
    discontinued BIGINT,
    minimum_reorder_quantity BIGINT,
    category TEXT,
    attachments TEXT
);

-- -----------------------------------------------------
-- Table purchase_order_status
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.purchase_order_status (
    id BIGINT,
    status TEXT
);

-- -----------------------------------------------------
-- Table suppliers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.suppliers (
    id BIGINT,
    company TEXT,
    last_name TEXT,
    first_name TEXT,
    email_address TEXT,
    job_title TEXT,
    business_phone TEXT,
    home_phone TEXT,
    mobile_phone TEXT,
    fax_number TEXT,
    address TEXT,
    city TEXT,
    state_province TEXT,
    zip_postal_code TEXT,
    country_region TEXT,
    web_page TEXT,
    notes TEXT,
    attachments TEXT
);

-- -----------------------------------------------------
-- Table purchase_orders
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.purchase_orders (
    id BIGINT,
    supplier_id BIGINT,
    created_by BIGINT,
    submitted_date TIMESTAMP,
    creation_date TIMESTAMP,
    status_id BIGINT,
    expected_date TIMESTAMP,
    shipping_fee DOUBLE PRECISION,
    taxes DOUBLE PRECISION,
    payment_date TIMESTAMP,
    payment_amount DOUBLE PRECISION,
    payment_method TEXT,
    notes TEXT,
    approved_by BIGINT,
    approved_date TIMESTAMP,
    submitted_by BIGINT
);

-- -----------------------------------------------------
-- Table inventory_transactions
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.inventory_transactions (
    id BIGINT,
    transaction_type BIGINT,
    transaction_created_date TIMESTAMP,
    transaction_modified_date TIMESTAMP,
    product_id BIGINT,
    quantity BIGINT,
    purchase_order_id BIGINT,
    customer_order_id BIGINT,
    comments TEXT
);

-- -----------------------------------------------------
-- Table invoices
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.invoices (
    id BIGINT,
    order_id BIGINT,
    invoice_date TIMESTAMP,
    due_date TIMESTAMP,
    tax DOUBLE PRECISION,
    shipping DOUBLE PRECISION,
    amount_due DOUBLE PRECISION
);

-- -----------------------------------------------------
-- Table order_details_status
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.order_details_status (
    id BIGINT,
    status TEXT
);

-- -----------------------------------------------------
-- Table order_details
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.order_details (
    id BIGINT,
    order_id BIGINT,
    product_id BIGINT,
    quantity DOUBLE PRECISION,
    unit_price DOUBLE PRECISION,
    discount DOUBLE PRECISION,
    status_id BIGINT,
    date_allocated TIMESTAMP,
    purchase_order_id BIGINT,
    inventory_id BIGINT
);

-- -----------------------------------------------------
-- Table purchase_order_details
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.purchase_order_details (
    id BIGINT,
    purchase_order_id BIGINT,
    product_id BIGINT,
    quantity DOUBLE PRECISION,
    unit_cost DOUBLE PRECISION,
    date_received TIMESTAMP,
    posted_to_inventory BIGINT,
    inventory_id BIGINT
);

-- -----------------------------------------------------
-- Table sales_reports
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.sales_reports (
    group_by TEXT,
    display TEXT,
    title TEXT,
    filter_row_source TEXT,
    default_value TEXT
);

-- -----------------------------------------------------
-- Table strings
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dl_northwind.strings (
    string_id BIGINT,
    string_data TEXT
);
