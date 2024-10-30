grails {
    views {
        gsp {
            viewDir = "/WEB-INF/views/"
            layout = "react"
        }
    }
    grails.resources.adhoc.patterns = ['/images/**']
}
appName = "openboxes"
signup.enabled = true

// JIRA Issue Collector
jira.issue.collector.enabled = false
jira.issue.collector.url = "https://openboxes.atlassian.net/s/d41d8cd98f00b204e9800998ecf8427e/en_USgc5zl3-1988229788/6318/12/1.4.10/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?collectorId=fb813fdb"

// Barcode scanner (disabled by default)
scannerDetection.enabled = false

// UserVoice widget
uservoice.widget.enabled = false
uservoice.widget.position = "right"

// Allow users to customize logo image url as well as label
logo.url = "/openboxestest/images/logo/openboxes_logo_40x40.jpg"
logo.label = ""
report.logo.url = "https://openboxes.com/img/logo_100.png"

// Zopim widget
zopim.widget.enabled = false
zopim.widget.url = "//v2.zopim.com/?2T7RMi7ERqr3s8N20KQ3wOBRudcwosBA"


// Barcode scanner (disabled by default)
scannerDetection.enabled = false 

// Print barcode labels via USB
barcode.printer.name = "printer-thermalprinter"

// Print barcode labels via RAW
barcode.printer.ipAddress = "127.0.0.1"
barcode.printer.port = 9100

// Default delay and min length for typeahead components
typeahead.delay = 300
typeahead.minLength = 3

// Allow system administrators to disable refresh on startup
refreshAnalyticsDataOnStartup.enabled = true

// Send stock alerts
jobs.sendStockAlertsJob.enabled = true
jobs.sendStockAlertsJob.skipOnEmpty = true
jobs.sendStockAlertsJob.daysUntilExpiry = 60
jobs.sendStockAlertsJob.cronExpression = "0 0 0 * * ?" // every day at midnight

// Refresh inventory snapshots
jobs.refreshInventorySnapshotJob.enabled = true
jobs.refreshInventorySnapshotJob.retryOnError = false
jobs.refreshInventorySnapshotJob.maxRetryAttempts = 3

// Refresh inventory snapshots after transaction (only for transaction entries)
jobs.refreshInventorySnapshotAfterTransactionJob.enabled = true
jobs.refreshInventorySnapshotAfterTransactionJob.retryOnError = false
jobs.refreshInventorySnapshotAfterTransactionJob.maxRetryAttempts = 3

// Refresh product availability materialized view
jobs.refreshProductAvailabilityJob.enabled = true
jobs.refreshProductAvailabilityJob.cronExpression = "0 0 0/2 * * ?" // every two hours starting at midnight

// Use delay when transactions are persisted to avoid missing data
jobs.refreshProductAvailabilityJob.delayStart = true
jobs.refreshProductAvailabilityJob.delayInMilliseconds = 5000

// Refresh transaction fact table
jobs.refreshTransactionFactJob.enabled = true
jobs.refreshTransactionFactJob.cronExpression = "0 0 0 * * ?" // every day at midnight

// Refresh stockout data for yesterday
jobs.refreshStockoutDataJob.enabled = true
jobs.refreshStockoutDataJob.cronExpression = "0 0 1 * * ?" // at 01:00:00am every day

// Refresh demand data snapshots
jobs.refreshDemandDataJob.enabled = true
jobs.refreshDemandDataJob.cronExpression = "0 0 1 * * ?" // at 01:00:00am every day

// Refresh order summary snapshots
jobs.refreshOrderSummaryJob.enabled = true
jobs.refreshOrderSummaryJob.cronExpression = "0 0 2 * * ?" // at 02:00:00am every day

// Assign identifier job
jobs.assignIdentifierJob.enabled = true
jobs.assignIdentifierJob.cronExpression = "0 * * * * ?" // every minute

// Calculate current quantity on hand
jobs.calculateQuantityJob.enabled = true
jobs.calculateQuantityJob.cronExpression = "0 0 0/12 * * ?" // every twelve hours starting at midnight
jobs.calculateQuantityJob.enableOptimization = false

// Calculate historical quantity on hand
jobs.calculateHistoricalQuantityJob.enabled = false
jobs.calculateHistoricalQuantityJob.cronExpression = "0 0 0 * * ?" // every day at midnight
jobs.calculateHistoricalQuantityJob.daysToProcess = 540   // 18 months

// Data Cleaning Job
jobs.dataCleaningJob.enabled = true
jobs.dataCleaningJob.cronExpression = "0 */5 * * * ?" // every five minutes

// Data Migration Job (enabled, but needs to be triggered manually)
jobs.dataMigrationJob.enabled = true

// Update exchange rates job
jobs.updateExchangeRatesJob.enabled = false
jobs.updateExchangeRatesJob.cronExpression = "0 0 * * * ?" // every hour

// LDAP configuration
ldap.enabled = false
ldap.context.managerDn = "cn=read-only-admin,dc=example,dc=com"
ldap.context.managerPassword = "password"
//ldap.context.server = "ldap://ldap.forumsys.com:389"
ldap.context.server.host = "ldap.forumsys.com"
ldap.context.server.port = 389

// LDAP Search
ldap.search.base = "dc=example,dc=com"
ldap.search.filter = "(uid={0})"
ldap.search.searchSubtree = true
ldap.search.attributesToReturn = ['mail', 'givenName']

// Merge Products
products.merge.enabled = false