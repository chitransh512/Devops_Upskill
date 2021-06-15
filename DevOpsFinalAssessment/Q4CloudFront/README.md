For this question i did the following steps:

1) created a s3 bucket for storing failover webapage.
2) created a cloudfront distribution using the s3 bucket as origin.
3) Created a route53 entry with a running load balancer's hostname.
4) Tried to setup alias & failover in routing policy but couldn't able to do it due to some technical difficulties as in the screenshot its visible that it didn't allowed me to change the routing policy.

After this step i supposed to be set the route to check its health & in any unhealthy case use the cloudfront failover dns.

Need to investigate more on this but i'm leaving this as it is for now due to time restrictions.
