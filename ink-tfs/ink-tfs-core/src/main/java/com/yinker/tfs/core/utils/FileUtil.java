package com.yinker.tfs.core.utils;

/**
 * @author haoyunfeng
 * @date 2016/5/5
 */
public class FileUtil {

    /**
     * 获取文件扩展名
     *
     * @param filename
     * @date 2016.5.5
     * @return
     */
    public static String getExtensionName(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot >-1) && (dot < (filename.length() - 1))) {
                return filename.substring(dot + 1);
            }
        }
        return filename;
    }

    /**
     * 获取文件名（不包含扩展名）
     * @param filename
     * @return
     */
    public static String getFileName(String filename){
        return filename.substring(0,filename.lastIndexOf("."));
    }
}
