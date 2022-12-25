package com.flatdevs.virtualassistant.contract;

import lombok.Builder;

@Builder
public class Result
{
    private boolean success;
    private Object message;
}
