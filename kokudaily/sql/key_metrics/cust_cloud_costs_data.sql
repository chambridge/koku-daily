select
    to_char(DATE_TRUNC('month', date), 'YYYY-MM') AS month,
    SUM(aws_unblended_cost) AS "aws_unblended_cost",
    SUM(aws_calculated_amortized_cost) AS "aws_calculated_amortized_cost",
    SUM(azure_pretax_cost) AS "azure_pretax_cost",
    SUM(gcp_unblended_cost) AS "gcp_unblended_cost",
    SUM(gcp_total) AS "gcp_total",
    SUM(oci_cost) AS "oci_cost"
from __cust_cloud_cost_report
GROUP BY DATE_TRUNC('month', date)
ORDER BY DATE_TRUNC('month', date)
;
