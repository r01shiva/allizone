# frozen_string_literal:true

MOBILE_APP = { 'app_version': '1.0' }.freeze

# TIME_ZONES = {
#   'Adelaide' => 'Australia/Adelaide',
#   'Brisbane' => 'Australia/Brisbane',
#   'Canberra' => 'Australia/Canberra',
#   'Darwin' => 'Australia/Darwin',
#   'Hobart' => 'Australia/Hobart',
#   'Melbourne' => 'Australia/Melbourne',
#   'Perth' => 'Australia/Perth',
#   'Sydney' => 'Australia/Sydney'
# }
# TIME_ZONES['India'] = 'Asia/Kolkata' if Rails.env == 'development'
# TIME_ZONES.freeze
#
# LICENCE_CLASSES = [
#   'C (Car licence)', 'R (Rider licence)',
#   'RE (Restricted Rider licence)', 'LR (Light Rigid licence)',
#   'MR (Medium Rigid licence)', 'HR (Heavy Rigid licence)',
#   'HC (Heavy Combination licence)', 'MC (Multi-Combination licence)'
# ].freeze
#
# ADDRESS_STATES = %w[ACT NSW NT QLD SA TAS VIC WA].freeze
# FLEET_SERVICED_BY = { 'in_house' => 'In-House', 'external' => 'External Repairer' }.freeze
#
# FLEET_TYPES = [
#   '(A) Trailer', '(B) Trailer',
#   'Dog Trailer', 'Light Commercial',
#   'Prime Mover', 'Rigid', 'Semitrailer', 'Van'
# ].freeze
#
# PRIMARY_FLEET_TYPES = ['Light Commercial', 'Prime Mover', 'Rigid', 'Van'].freeze
#
# TRAILER1_TYPES = ['(A) Trailer', '(B) Trailer', 'Dog Trailer', 'Semitrailer'].freeze
#
# TRAILER2_TYPES = ['(B) Trailer', 'Dog Trailer', 'Semitrailer'].freeze
#
# FLEET_SERVICE_TYPES = ['A Service', 'B Service', 'C Service', 'Inspection Service', 'Maintenance Service'].freeze
#
# FLEET_NEXT_SERVICE_TYPES = {
#   'a_service' => 'A Service',
#   'b_service' => 'B Service',
#   'c_service' => 'C Service'
# }.freeze
#
# FLEET_OWNER_TYPES = [
#   'Company', 'Sub-Contractor',
#   'Tow Operator'
# ].freeze
#
# DRIVER_OWNER_TYPES = [
#   'Company', 'Sub-Contractor',
#   'Tow Operator'
# ].freeze
#
# FLEET_APPROVAL_TYPES = %w[HML IAP PBS].freeze
#
# SERVICE_TYPES = [
#   'Mechanical Repairs', 'Servicing',
#   'Wheels & Tyres', 'Roadside Assistance',
#   'Electrical', 'Aircon & Refrigeration',
#   'Hydraulics', 'Other'
# ].freeze
#
# FAULT_PRIORITY = { 'minor' => 'Minor', 'major' => 'Major', 'critical' => 'Critical' }.freeze
#
# INCIDENT_TYPE = {
#   'injury' => 'Injury', 'near_miss' => 'Near Miss',
#   'motor_vehicle' => 'Motor Vehicle',
#   'environmental' => 'Environmental',
#   'property' => 'Property', 'equipment' => 'Equipment',
#   'personal_health' => 'Personal Health',
#   'infringement' => 'Infringement'
# }.freeze
#
# DEFERRED_UNTIL = {
#   'until_parts_arrive' => 'Until Parts Arrive',
#   'until_next_service' => 'Until Next Service',
#   'until_next_week' => 'Until Next Week'
# }.freeze
#
# FAULT_STATUS = %w[open deferred monitored closed].freeze
#
# DOC_EXPIRED = 'business_document_is_expired'
# DOC_WILL_EXPIRE = 'business_document_will_expire'
#
# TO_ADMIN_DRIVER_DOC_EXPIRED = 'to_admin_driver_document_is_expired'
# TO_ADMIN_DRIVER_DOC_WILL_EXPIRE = 'to_admin_driver_document_will_expire'
#
# DRIVER_DOC_EXPIRED = 'driver_document_is_expired'
# DRIVER_DOC_WILL_EXPIRE = 'driver_document_will_expire'
#
# FLEET_DOC_EXPIRED = 'to_admin_fleet_document_is_expired'
# FLEET_DOC_WILL_EXPIRE = 'to_admin_fleet_document_will_expire'
# FAULT_RECORDED = 'fault_recorded'
# OPEN_MINOR_FAULT = 'open_minor_fault'
# OPEN_MAJOR_OR_CRITICAL_FAULT = 'open_major_or_critical_fault'
# OPEN_MONITOR_OR_DEFERRED_REPORT = 'open_monitor_or_deferred_report'
#
# EMAIL_TEMPLATES = {
#   'welcome_company' => {
#     'title' => 'Welcome email template for company',
#     'tags' => %w[
#       company_name company_email
#       company_contact_person_first_name login_url password company_contact_person_full_name
#     ]
#   },
#   'welcome_company_user' => {
#     'title' => 'Welcome email template for company users',
#     'tags' => %w[company_name user_name user_email login_url password]
#   },
#   'welcome_administrator' => {
#     'title' => 'Welcome email template for administrator',
#     'tags' => %w[administrator_name administrator_email login_url password]
#   },
#   'welcome_driver' => {
#     'title' => 'Welcome email template for driver',
#     'tags' => %w[driver_first_name driver_full_name driver_email driver_pin driver_company_name]
#   },
#   'welcome_sub_contractor' => {
#     'title' => 'Welcome email template for subcontractor',
#     'tags' => %w[
#       company_name
#       subcontractor_email
#       login_url password
#       subcontractor_contact_first_name
#       subcontractor_contact_full_name
#       subcontractor_company_name
#     ]
#   },
#   'forget_password_email_template' => {
#     'title' => 'Forget password email template with reset password link',
#     'tags' => %w[email reset_link name]
#   },
#   'driver_recieved_new_job' => {
#     'title' => 'Alert driver when assigned a new job',
#     'tags' => %w[driver_name driver_email job_title]
#   },
#   'driver_speed_breach_alert' => {
#     'title' => 'Alert company/users when low/medium/high/extreme breach recorded',
#     'tags' => %w[driver_name speed_breach_type id]
#   },
#   'fault_recorded' => {
#     'title' => 'Alert admin when a fault is recorded',
#     'tags' => %w[person_name creater_name]
#   },
#   'fault_date_reached_and_not_closed' => {
#     'title' => 'Alert Admin when monitor or defer fault date reached and not closed',
#     'tags' => %w[person_name report_number fault_type]
#   },
#   'minor_fault_reported_days_ago_and_report_is_open' => {
#     'title' => 'Alert Admin when Minor Fault reported 5/10 days ago and not closed',
#     'tags' => %w[person_name no_of_days report_number]
#   },
#   'major_or_critical_fault_not_closed' => {
#     'title' => 'Alert Admin when Major or Critical fault not closed (daily)',
#     'tags' => %w[person_name fault_type report_number]
#   },
#   'service_due_in_km' => {
#     'title' => 'Alert Admin when service due in 1000/2000 km',
#     'tags' => %w[person_name service_type due_by_distance fleet_reg_no]
#   },
#   'service_due' => {
#     'title' => 'Alert Admin when service is due',
#     'tags' => %w[person_name service_type fleet_reg_no]
#   },
#   'driver_accepted_new_job' => {
#     'title' => 'Alert driver when assigned a new job',
#     'tags' => %w[driver_name driver_email job_title]
#   },
#   'driver_rest_hour_breech' => {
#     'title' => 'Alert driver when there is a rest hour speed breach',
#     'tags' => %w[driver_name driver_email]
#   },
#   'contact_us' => {
#     'title' => 'To admin from contact us page.',
#     'tags' => %w[contact_name contact_phone contact_email message]
#   },
#   'zip_link' => {
#     'title' => 'To user with a download link for report zip',
#     'tags' => %w[user_name link report_type]
#   },
#   'training' => {
#     'title' => 'To trainee assigned for training with a link for training',
#     'tags' => %w[training_title training_link_name]
#   },
#   'training_due' => {
#     'title' => 'To trainees when 14 days left for training expires',
#     'tags' => %w[training_title training_link_name training_expiry_date]
#   },
#   DOC_WILL_EXPIRE => {
#     'title' => 'To company and its users when 14/7/1 day(s) left for business document expiration',
#     'tags' => %w[days_left_for_expiration document_type document_title expiry_date]
#   },
#   DOC_EXPIRED => {
#     'title' => 'To company and its users when a business document is expired',
#     'tags' => %w[document_type document_title expiry_date]
#   },
#   TO_ADMIN_DRIVER_DOC_WILL_EXPIRE => {
#     'title' => 'To company and its users when 14/7/1 day(s) left for driver document expiration',
#     'tags' => %w[days_left_for_expiration document_title expiry_date driver_name]
#   },
#   TO_ADMIN_DRIVER_DOC_EXPIRED => {
#     'title' => 'To company and its users when a driver document is expired',
#     'tags' => %w[document_title expiry_date driver_name]
#   },
#   DRIVER_DOC_WILL_EXPIRE => {
#     'title' => 'To driver when 14/7/1 day(s) left for document expiration',
#     'tags' => %w[document_title expiry_date driver_name days_left_for_expiration]
#   },
#   DRIVER_DOC_EXPIRED => {
#     'title' => 'To driver when its document is expired',
#     'tags' => %w[document_title expiry_date driver_name]
#   },
#   FLEET_DOC_WILL_EXPIRE => {
#     'title' => 'To company and its users when 14/7/1 day(s) left for fleet document expiration',
#     'tags' => %w[days_left_for_expiration document_title expiry_date reg_no]
#   },
#   FLEET_DOC_EXPIRED => {
#     'title' => 'To company and its users when a fleet document is expired',
#     'tags' => %w[document_title expiry_date reg_no]
#   },
#   FAULT_RECORDED => {
#     'title' => 'To company and its users when a fault is recorded',
#     'tags' => %w[recorded_date driver_name priority reg_no report_no]
#   },
#   OPEN_MINOR_FAULT => {
#     'title' => 'To company and its users when a minor fault reported 5/10 days ago and not closed',
#     'tags' => %w[recorded_date creater_name reg_no no_of_days report_no]
#   },
#   OPEN_MAJOR_OR_CRITICAL_FAULT => {
#     'title' => 'To company and its users for an open major or critical fault report',
#     'tags' => %w[recorded_date creater_name reg_no priority report_no]
#   },
#   OPEN_MONITOR_OR_DEFERRED_REPORT => {
#     'title' => 'To company and its users for an open monitor or deferred fault report',
#     'tags' => %w[recorded_date creater_name reg_no type no_of_days closing_date report_no]
#   },
#   'daily_activity_report' => {
#     'title' => 'To send daily activities report to logged in user',
#     'tags' => %w[user_name report_type start_date end_date]
#   },
#   'payroll_report_to_multiple_users' => {
#     'title' => 'To send daily payroll report to multiple users',
#     'tags' => %w[company_name cycle_type report_type start_date end_date]
#   },
#   'payroll_report_to_one_user' => {
#     'title' => 'To send daily payroll report to single user',
#     'tags' => %w[user_name company_name cycle_type report_type start_date end_date]
#   },
#   'mass_management_report' => {
#     'title' => 'To send mass management report to logged in user',
#     'tags' => %w[user_name report_type start_date end_date]
#   }
# }.freeze
#
# ACTIVITY_ACTIONS = {
#   'start_work' => 'Start Work',
#   'start_break' => 'Start Break',
#   'finish_break' => 'Finish Break',
#   'fault_reported' => 'Fault Reported',
#   'fitness_duty' => 'Fitness For Duty Declaration Completed',
#   'prestart_vehicle' => 'Pre Start Vehicle Inspection Completed',
#   'picked' => 'Picked',
#   'delivered' => 'Delivered',
#   'finish_work' => 'Finish Work',
#   'trailer_check' => 'Trailer Check Completed',
#   'fuel_added' => 'Fuel Added',
#   'refrigeration_temperature_log_added' => 'Refrigeration Temperature Log Added',
#   'fatigue_breach_recorded' => 'Fatigue Breach Recorded', 'rest_hour_breach_recorded' => 'Rest Hour Breach Recorded'
# }.freeze
#
# WEB_ACTIVITY_ACTIONS = {
#   'start_work' => 'Start Work',
#   'start_break' => 'Start Break',
#   'finish_break' => 'Finish Break',
#   'fault_reported' => 'Fault Reported',
#   'fitness_duty' => 'Fitness For Duty Declaration Completed',
#   'prestart_vehicle' => 'Pre Start Vehicle Inspection Completed',
#   'picked' => 'Picked',
#   'delivered' => 'Delivered',
#   'finish_work' => 'Finish Work',
#   'trailer_check' => 'Trailer Check Completed',
#   'fuel_added' => 'Fuel Added',
#   'refrigeration_temperature_log_added' => 'Refrigeration Temperature Log Added'
# }.freeze
#
# EMPLOYEE_ACTIVITY_ACTIONS = {
#   'start_work' => 'Start Work',
#   'fitness_duty' => 'Fitness For Duty Declaration Completed',
#   'start_break' => 'Start Break',
#   'finish_break' => 'Finish Break',
#   'finish_work' => 'Finish Work'
# }.freeze
#
# NCR_TYPE = {
#   'fatigue_breach' => 'Fatigue Breach',
#   'low_speed_breach' => 'Low Speed Breach',
#   'speed_breach' => 'Speed Breach',
#   'route_breach' => 'Route Breach',
#   'documentation' => 'Documentation',
#   'infringement' => 'Infringement',
#   'complaint' => 'Complaint',
#   'rest_hour_breach' => 'Rest Hour Breach',
#   'other' => 'Other'
# }.freeze
#
# SPEED_BREACH_CATEGORY = {
#   'low' => 'LOW',
#   'medium' => 'MEDIUM',
#   'high' => 'HIGH',
#   'extreme' => 'EXTREME'
# }.freeze
#
# NCR_DETAIL_TEMPLATES = {
#   'speed_breach' => {
#     'body' => 'This NCR is associated with {category} Speed Breach(es)',
#     'tags' => %w[category]
#   },
#   'fatigue_breach' => {
#     'body' => '{breachable_type} breach has been generated for driver {driver_name}',
#     'tags' => %w[driver_name breachable_type]
#   },
#   'rest_hour_breach' => {
#     'body' => 'A rest hour breach has been recorded on {time} for driver {driver_name}',
#     'tags' => %w[driver_name time]
#   }
# }.freeze
#
# PRODUCTION_URL = 'https://complianceeasy.com.au'
# DEVELOPMENT_URL = 'https://development.complianceeasy.com.au'
# ADMIN_PRODUCTION_URL = 'https://admin.complianceeasy.com.au'
# ADMIN_DEVELOPMENT_URL = '//https://devadmin.complianceeasy.com.au/'
#
# FATIGUE_BREACH_CATEGORY = {
#   'StationaryRestTemplate' => 'Stationary Rest',
#   'NightRestTemplate' => 'Night Stationary Rest',
#   'LongNightWorkTemplate' => 'Long Night Work',
#   'DailyWorkOpportunity' => 'Daily Work Opportunity'
# }.freeze
#
# NCR_STATUS = {
#   'car_required' => 'CAR Required',
#   'far_required' => 'FAR Required',
#   'completed' => 'Completed'
# }.freeze
#
# INCIDENT_STATUS = {
#   'open' => 'Investigation Required',
#   'car_required' => 'CAR Required',
#   'far_required' => 'FAR Required',
#   'completed' => 'Completed'
# }.freeze
#
# A_SERVICE = 'a_service'
# B_SERVICE = 'b_service'
# C_SERVICE = 'c_service'
# SPEEDOMETER_MARGIN = 5000
#
# # Below constants will be sent to mobile app
# # Fleet current location update API's time interval for mobile app
# LOCATION_INTERVAL = 100_00 # time in miliseconds
# CONTACT_US_EMAIL = Rails.env.production? ? 'admin@complianceeasy.com.au' : 'diksha.kumari@ksolves.com'
# MAP_LATITUDE = -23.695227
# MAP_LONGITUDE = 133.877147
# CONTACT_US_PHN = '02 4392 2000 '
# CONTINUOUS_TRIP = 'continue'
# SPEED_ACCELERATE = 7
# SPEED_DEACCELERATE = 10
# BUSINESS_DOCUMENT_TYPES = %w[
#   toolbox_talk risk_assessment operating_manual
#   policy certificate emergency_procedure
# ].freeze
# BUSINESS_DOCUMENT_EXPIRES = 'business_document_expires'
# DRIVER_DOC_EXPIRES = 'driver_document_expires'
# FLEET_DOC_EXPIRES = 'fleet_document_expires'
# FAULT_MANAGEMENT_ALERT = 'fault_management'
# TRAINING_EXPIRES_ALERT = 'training_expires'
# ALERT_TYPES = %w[
#   business_document_expires
#   driver_document_expires
#   fleet_document_expires
#   fault_management
#   training_expires
# ].freeze
# FAULT_MANAGEMENT_ALERT_TYPES = %w[open_minor_fault open_major_or_critical_fault open_monitor_or_deferred_report].freeze
#
# REPORT_TYPE = {
#   'nwd' => 'National Work Diary',
#   'daily_activities' => 'Daily Activities',
#   'pod' => 'POD',
#   'pre_start_check_reports' => 'PreStart Check',
#   'payroll_reports' => 'Payroll',
#   'mass_management_reports' => 'Mass Management'
# }.freeze
#
# PAYROLL_CYCLE = {
#   '7' => 'Weekly',
#   '14' => 'Fornightly',
#   '30' => 'Monthly'
# }.freeze
# WEEK_DAYS = %w[Monday Tuesday Wednesday Thursday Friday Saturday
#                Sunday].freeze
# PAYROLL_OTHER = { 'include_rest' => 'Include Rest' }.freeze
#
# SUB_CONTRACTOR_MODULES = %w[
#   Driver Fleet FatigueActivity
#   FaultReport HazardReport IncidentReport
#   FleetService NonConformanceReport GpsTracking
#   Job SpeedBreach FuelRegister Pod FatigueBreach Report
#   Payroll LoadRegister RefrigerationTemperatureLog
# ].freeze
#
# WEIGH_METHODS = {
#   'weighbridge' => 'Weighbridge',
#   'on_board_scales' => 'On-Board Scales',
#   'air_gauges' => 'Air Gauges',
#   'paperwork' => 'Paperwork',
#   'other' => 'Other'
# }.freeze
#
# HIDE_MODULES_FROM_ADMIN_ROLES = %w[SubContractor].freeze
