package com.lancrypt.lctenantmgmcmp.config.models;

public class ApplicationUrlProperties {

    private BackendUrlProperties backend;
    private FrontendUrlProperties frontend;

    public BackendUrlProperties getBackend() {
        return backend;
    }

    public void setBackend(BackendUrlProperties backend) {
        this.backend = backend;
    }

    public FrontendUrlProperties getFrontend() {
        return frontend;
    }

    public void setFrontend(FrontendUrlProperties frontend) {
        this.frontend = frontend;
    }
}
