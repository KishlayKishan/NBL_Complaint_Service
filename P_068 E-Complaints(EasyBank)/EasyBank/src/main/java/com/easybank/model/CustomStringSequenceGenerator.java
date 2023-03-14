package com.easybank.model;
import java.io.Serializable;

import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class CustomStringSequenceGenerator implements IdentifierGenerator {

    private static final String PREFIX = "NBL";
    private static final int INITIAL_VALUE = 1;
    private int sequenceValue = INITIAL_VALUE;

    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object object) {
        String sequence = PREFIX + String.format("%04d", sequenceValue++);
        return sequence;
    }
}