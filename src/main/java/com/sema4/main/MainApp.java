package com.sema4.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {

    private final static Logger log = LoggerFactory.getLogger(MainApp.class);

    public static void main(String[] args) {
        log.debug("Entering Main...");
        AbstractApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        log.debug("Context returned" + ctx);
        ctx.start();
        log.info("Application context started");
        try {
            Thread.sleep(5 * 60 * 1000);
        }
        catch (InterruptedException e) {
            e.printStackTrace();
        }
        ctx.stop();
        ctx.close();
        log.info("Application exiting");
    }
}
