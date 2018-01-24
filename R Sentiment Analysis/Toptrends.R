#assuming input = Ottawa
a_trends = availableTrendLocations()
woeid = a_trends[Which(a_trends$name=="Chennai"),320]
india_trend =getTrends(woeid)
trends = india_trend[1:2]

trends
