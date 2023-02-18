package com.cs137.javaservletwebapp.service;

import com.cs137.javaservletwebapp.model.Product;

import javax.swing.text.html.Option;
import java.util.*;

public class ProductService{

    private final HashMap<String, Product> productHashMap = new HashMap<>();
    private static final List<Product> productList = Arrays.asList(
            new Product("img/products/iphone14-pro1.png", "iPhone 14 Pro", "Apple Inc.", 1000.00, 4.8, Arrays.asList("img/products/iphone14-pro1.png", "img/products/iphone14-pro2.png", "img/products/iphone14-pro3.png"), "The iPhone 14 Plus comes with 6.1-inch OLED display with 120Hz refresh rate and Apple's improved Bionic A16 processor. On the back there is a Triple camera setup with 48MP main camera"),
            new Product("img/products/iphone13-midnight.png", "iPhone 13", "Apple Inc.", 729.99, 4.2, Arrays.asList("img/products/iphone13-midnight.png"), "The iPhone 13 is the successor to Apple's best selling iPhone 12, and it improves upon a successful formula: $800 price for a flagship processor and a 6.1-inch screen size that is not too large, nor too small. The iPhone 13 brings a new Apple A15 Bionic chip and improvements to the dual camera setup consisting of a wide and ultra-wide camera."),
            new Product("img/products/google-pixel7-Pro.png", "Google Pixel 7", "Google", 1000.00, 4.4, Arrays.asList("img/products/google-pixel7-Pro.png"), "The Pixel 7 comes with 6.3-inch OLED display with 90Hz refresh rate and Google Tensor G2 processor. Specs also include 4355mAh battery, Dual camera on the back with 50MP main sensor and 10.8MP front selfie camera."),
            new Product("img/products/samsung-galaxy-s23Plus-Lavender.png", "Samsung Galaxy S23 Plus", "Samsung", 1000.00, 4.8, Arrays.asList("img/products/samsung-galaxy-s23Plus-Lavender.png"), "The Samsung Galaxy S23+ is the bigger sibling of the regular Galaxy S23 with it’s 6.6-inch Dynamic AMOLED display with 120Hz refresh rate. Specs also include Qualcomm Snapdragon 8 Gen 2 processor, 4700mAh battery and Triple camera setup on the back."),
            new Product("img/products/samsung-galaxy-s22.png", "Samsung Galaxy S22", "Samsung", 349.99, 3.8, Arrays.asList("img/products/samsung-galaxy-s22.png"), "The Samsung Galaxy S22 specs are top-notch including a Snapdragon 8 Gen 1 chipset, 8GB RAM coupled with 128/256GB storage, and a 3700mAh battery with 25W charging speed. The phone sports a 6.1-inch Dynamic AMOLED display with an adaptive 120Hz refresh rate. In the camera department there is a Triple-sensor setup is present."),
            new Product("img/products/La Brique 1.0.png", "La Brique 1.0", "Motorola", 10.00, 5.0, Arrays.asList("img/products/La Brique 1.0.png"), "La Brique 1.0 Cell Phone Mobile Phone, Four Card Four Standby Quad-Band 2G Retro Bluetooth New Classic Old Mobile Phone, 2G GSM 850/900/1800/1900Mhz (Gold)"),
            new Product("img/products/Lime 7- Pro.png", "Lime 7 - Pro", "Motorola", 30.00, 3.4, Arrays.asList("img/products/Lime 7- Pro.png"), "The OnePlus 7 Pro is here & faster than ever. Skinit's Solids skins for OnePlus 7 Pro makes for the perfect accessory to add to your OnePlus smartphone! The Lime skin is made with high-quality 3M vinyl, allowing for an easy, hassle-free application & removal process. Skinit's 3M phone skins are guaranteed to not leave any sticker residue on your OnePlus smartphone. With vibrant color and an original Solids design, you'll love how this Lime OnePlus 7 Pro skin looks on your OnePlus phone!"),
            new Product("img/products/Doro-750-Consumer-Cellular-Phone.png", "Doro 750", "Doro", 35.00, 3.2, Arrays.asList("img/products/Doro-750-Consumer-Cellular-Phone.png"), "See everything effortlessly and enjoy easy calling and texting with a flip phone that brings you a large display and widely separated, high contrast keys. Based on our award-winning design, this new generation phone for fast, 4G LTE networks combines complete ease of use with a comfortable, soft touch grip and loud, high quality sound. Other features include easy navigation, a flashlight and a shortcut key for the camera."),
            new Product("img/products/iphone11.png", "iPhone 11", "Apple Inc.", 900.00, 3.5, Arrays.asList("img/products/iphone11.png"), "The iPhone 11 serves as the de facto successor to the iPhone XR. It scores a 12MP ultra wide-angle camera at the rear which has a focal length of just 13mm and an aperture of F2.4. The iPhone 11 also gets a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode. The A13 Bionic chipset is more powerful and efficient, adding an additional hour of battery life compared to the iPhone XR."),
            new Product("img/products/iphone12.png", "iPhone 12", "Apple Inc.", 950.00, 4.0, Arrays.asList("img/products/iphone12.png"), "Apple iPhone 12 is the bigger version of the regular iPhone 12 mini. The handset's hardware include a 6.1-inch OLED display, 5nm Apple A14 Bionic processor, and a dual-camera setup with a large sensor. 5G and Face ID are on board, too"),
            new Product("img/products/iphone13max.png", "iPhone 13 Pro Max", "Apple Inc.", 950.00, 4.0, Arrays.asList("img/products/iphone13max.png"), "The iPhone 13 Pro Max is Apple's biggest phone in the lineup with a massive, 6.7\" screen that for the first time in an iPhone comes with 120Hz ProMotion display that ensures super smooth scrolling. The benefit of such a gigantic phone is that it also comes with the biggest battery of all iPhone 13 series. Apple also introduces improvements to all three cameras on the Pro Max, the wide, ultra-wide and telephoto zoom ones, but there is no periscope style long-range zoom like on many Android phones."));


    public ProductService() {
        for (var product : ProductService.productList) {
            this.productHashMap.put(product.getId().toString(), product);
        }
    }
    public List<Product> getProducts() {
        return ProductService.productList;
    }

    public Optional<Product> find(String productId) {
        return Optional.ofNullable(this.productHashMap.get(productId));
    }
}
