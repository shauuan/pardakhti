# ERD متنی — مرحله ۱ (طرح؛ هنوز پیاده‌سازی نشده)

```
CompanyProfile (1) ──────────── (1) AppAuth
       │
       │ 1
       │
       ▼ N
FiscalYearSettings ──── (N) TaxBracket
       │
       │ کپی از سال قبل
       │
PayItemDefinition (کاتالوگ اقلام؛ فلگ بیمه/مالیات)
       │
       │
Employee ──── (N) EmployeePayItem ──► PayItemDefinition
   │
   │
MonthlyPeriod (year, month, status open/locked, settingsSnapshot JSON)
   │
   ├── (N) MonthlyInput (per employee: days, OT hours, night, holiday, manual amounts…)
   │
   └── (N) PayrollResult (employeeId, totals, breakdown JSON, manual overrides)
   
AuditLog (entity, action, before/after, reason, at)
```

## جداول و فیلدهای کلیدی

### company_profile
- id, name, national_id, economic_code, insurance_workshop_code, address, phone, logo_path, display_currency (rial|toman)

### app_auth
- password_hash, salt, recovery_key_hash, created_at

### fiscal_year_settings
- id, year (unique), min_daily_wage, min_monthly_wage, housing, food, marriage, child_factor_days, seniority_daily, insurance_employee_pct, insurance_employer_pct, unemployment_pct, hard_job_extra_pct, insurance_ceiling_factor, day_basis (fixed30|actual), hourly_divisor_mode (7_33|220), ot_factor, night_factor, holiday_factor, rounding_mode, tax_table_basis (monthly|annual), settings_json (سایر)

### tax_brackets
- id, fiscal_year_id, from_amount, to_amount (nullable=∞), rate_percent, sort_order

### pay_item_definitions
- id, code, name, kind (earning|deduction), calc_method (fixed_monthly|daily_x_attendance|factor_of_base|manual), subject_to_insurance, subject_to_tax, exemption_cap (nullable), needs_review, is_system, active, sort_order

### employees
- id, personnel_code (unique), national_id (unique), insurance_number (unique nullable), first_name, last_name, father_name, birth_date, gender, marital_status, children_count, child_allowance_eligible, hire_date, contract_type, department, job_title, bank_name, sheba (validated), account_number, daily_wage, seniority_bases (nullable override), is_hard_job, active, notes

### employee_pay_items
- id, employee_id, pay_item_id, amount_or_factor, active

### monthly_periods
- id, year, month, status (draft|locked), locked_at, settings_snapshot_json (unique year+month)

### monthly_inputs
- id, period_id, employee_id, worked_days, overtime_hours, night_hours, holiday_hours, absence_days, unpaid_leave_days, manual_item_json, unique(period, employee)

### payroll_results
- id, period_id, employee_id, gross, insurance_base, employee_insurance, employer_insurance, unemployment_insurance, tax_base, tax, other_deductions, net, employer_total_cost, breakdown_json, manual_adjusted, adjustment_reason, unique(period, employee)

### audit_logs
- id, at, action, entity_type, entity_id, summary, before_json, after_json, reason

## قیود اعتبارسنجی (بعداً در لایه domain)
- کد ملی ۱۰ رقمی + الگوریتم کنترل
- شبا ایران (IR + ۲۴ رقم) با الگوریتم
- یکتایی کد پرسنلی، کد ملی، شماره بیمه
