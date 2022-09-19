 WITH cust_non_redhat AS (
    SELECT t.customer_id,
           array_agg(DISTINCT substring(t.email from '@(.*)$')) AS domain
    FROM   PUBLIC.api_user t
    WHERE  substring(t.email FROM '@(.*)$') != 'redhat.com'
    GROUP BY t.customer_id
)
SELECT COALESCE(c.account_id, 'unknown') as account_id,
       cnr.domain,
       c.org_id
FROM   PUBLIC.api_customer c
JOIN   cust_non_redhat AS cnr
ON     cnr.customer_id = c.id
WHERE    c.org_id NOT IN ('11789772',
                          '6340056',
                          '11009103',
                          '1979710',
                          '12667745',
                          '12667749')
