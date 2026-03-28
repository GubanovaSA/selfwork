
SELECT 
    '-- Дамп базы данных CRM' AS sql_line
UNION ALL
SELECT '-- Создан: ' || CURRENT_DATE
UNION ALL
SELECT '-- Схема: crm'
UNION ALL
SELECT ''
UNION ALL
SELECT '-- Создание схемы'
UNION ALL
SELECT 'CREATE SCHEMA IF NOT EXISTS crm;'
UNION ALL
SELECT ''
UNION ALL
SELECT 'SET search_path TO crm;'
UNION ALL
SELECT ''
UNION ALL
SELECT '-- Таблица companies'
UNION ALL
SELECT 'DROP TABLE IF EXISTS crm.companies CASCADE;'
UNION ALL
SELECT 'CREATE TABLE crm.companies ('
UNION ALL
SELECT '    company_id SERIAL PRIMARY KEY,'
UNION ALL
SELECT '    name VARCHAR(200) NOT NULL,'
UNION ALL
SELECT '    industry VARCHAR(100),'
UNION ALL
SELECT '    website VARCHAR(100),'
UNION ALL
SELECT '    phone VARCHAR(20),'
UNION ALL
SELECT '    created_date DATE DEFAULT CURRENT_DATE'
UNION ALL
SELECT ');'
UNION ALL
SELECT ''
UNION ALL
SELECT '-- Таблица contacts'
UNION ALL
SELECT 'DROP TABLE IF EXISTS crm.contacts CASCADE;'
UNION ALL
SELECT 'CREATE TABLE crm.contacts ('
UNION ALL
SELECT '    contact_id SERIAL PRIMARY KEY,'
UNION ALL
SELECT '    company_id INT REFERENCES crm.companies(company_id),'
UNION ALL
SELECT '    first_name VARCHAR(50) NOT NULL,'
UNION ALL
SELECT '    last_name VARCHAR(50) NOT NULL,'
UNION ALL
SELECT '    email VARCHAR(100) UNIQUE,'
UNION ALL
SELECT '    phone VARCHAR(20),'
UNION ALL
SELECT '    position VARCHAR(100),'
UNION ALL
SELECT '    is_decision_maker BOOLEAN DEFAULT FALSE'
UNION ALL
SELECT ');'
UNION ALL
SELECT ''
UNION ALL
SELECT '-- Таблица deals'
UNION ALL
SELECT 'DROP TABLE IF EXISTS crm.deals CASCADE;'
UNION ALL
SELECT 'CREATE TABLE crm.deals ('
UNION ALL
SELECT '    deal_id SERIAL PRIMARY KEY,'
UNION ALL
SELECT '    company_id INT REFERENCES crm.companies(company_id),'
UNION ALL
SELECT '    deal_name VARCHAR(200) NOT NULL,'
UNION ALL
SELECT '    stage VARCHAR(50),'
UNION ALL
SELECT '    amount NUMERIC(12,2),'
UNION ALL
SELECT '    probability INT,'
UNION ALL
SELECT '    expected_close_date DATE,'
UNION ALL
SELECT '    actual_close_date DATE'
UNION ALL
SELECT ');'
UNION ALL
SELECT ''
UNION ALL
SELECT '-- Таблица activities'
UNION ALL
SELECT 'DROP TABLE IF EXISTS crm.activities CASCADE;'
UNION ALL
SELECT 'CREATE TABLE crm.activities ('
UNION ALL
SELECT '    activity_id SERIAL PRIMARY KEY,'
UNION ALL
SELECT '    contact_id INT REFERENCES crm.contacts(contact_id),'
UNION ALL
SELECT '    deal_id INT REFERENCES crm.deals(deal_id),'
UNION ALL
SELECT '    type VARCHAR(50),'
UNION ALL
SELECT '    notes TEXT,'
UNION ALL
SELECT '    activity_date DATE DEFAULT CURRENT_DATE'
UNION ALL
SELECT ');';