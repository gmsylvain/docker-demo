package com.sema4.processor;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;


public class MsgProcessor implements Processor {

    private int msgCount = 0;
    private String eom = "\n";
    private String processorType;

    public void init() {
       if ( null == processorType ) {
           throw new RuntimeException("processorType not set.");
       }
    }

    public void process(Exchange exchange) throws Exception {
        String body = exchange.getIn().getBody(String.class);
        System.out.println("Msg Received on " + processorType + ": " + body);
    }

    public void setEOM(String eomMarker) {
       this.eom = eomMarker;
    }

    public void setProcessorType(String argType) {
       this.processorType = argType;
    }

}
