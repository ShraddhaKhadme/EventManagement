package com.app.utils;

import java.util.Map;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

public class CloudinaryUploader {
    public static String upload(String filePath) throws Exception {
        // Initialize Cloudinary configuration
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "your_cloud_name",
            "api_key", "your_api_key",
            "api_secret", "your_api_secret"
        ));

        Map uploadResult = cloudinary.uploader().upload(filePath, ObjectUtils.emptyMap());
        return (String) uploadResult.get("url");
    }
}
