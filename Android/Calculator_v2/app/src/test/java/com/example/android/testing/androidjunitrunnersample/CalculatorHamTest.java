package com.example.android.testing.androidjunitrunnersample;

import org.junit.Test;
import org.junit.Before;

import static org.hamcrest.Matchers.greaterThan;
import static org.hamcrest.Matchers.both;
import static org.hamcrest.Matchers.lessThan;
import static org.hamcrest.MatcherAssert.assertThat;

public class CalculatorHamTest {

    private Calculator mCalculator;

    @Before
    public void setUp() {
        mCalculator = new Calculator();
    }

    @Test
    public void calculator_CorrectHamAdd_ReturnsTrue() {

        assertThat((int)mCalculator.add(3, 4), both(greaterThan(6)).and(lessThan(8)));

    }
}