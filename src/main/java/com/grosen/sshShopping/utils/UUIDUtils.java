package com.grosen.sshShopping.utils;

import java.util.UUID;

/**
 * @author Grosen
 * @create 2020-08-29 15:51
 */
public class UUIDUtils {
    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-","");
    }
}
