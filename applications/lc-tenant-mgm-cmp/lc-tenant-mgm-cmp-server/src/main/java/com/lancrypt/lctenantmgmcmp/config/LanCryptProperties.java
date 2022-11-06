package com.lancrypt.lctenantmgmcmp.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

import com.lancrypt.lctenantmgmcmp.config.models.ApplicationUrlProperties;
import com.lancrypt.lctenantmgmcmp.config.models.AuditingProperties;
import com.lancrypt.lctenantmgmcmp.config.models.SchedulingProperties;

@ConfigurationProperties(prefix = "lc", ignoreUnknownFields = false)
public class LanCryptProperties {

    private ApplicationUrlProperties applicationUrls;

    private AuditingProperties auditing;

    private SchedulingProperties scheduling;

    public ApplicationUrlProperties getApplicationUrls() {
        return applicationUrls;
    }

    public void setApplicationUrls(ApplicationUrlProperties applicationUrls) {
        this.applicationUrls = applicationUrls;
    }

    public AuditingProperties getAuditing() {
        return auditing;
    }

    public void setAuditing(AuditingProperties auditing) {
        this.auditing = auditing;
    }

    public SchedulingProperties getScheduling() {
        return scheduling;
    }

    public void setScheduling(SchedulingProperties scheduling) {
        this.scheduling = scheduling;
    }
}
