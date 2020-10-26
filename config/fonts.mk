#Fonts
FONT_PATH := vendor/uosp/fonts
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(FONT_PATH)/ttf,$(TARGET_COPY_OUT_PRODUCT)/fonts)

PRODUCT_COPY_FILES += \
    $(FONT_PATH)/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# Font overlays
PRODUCT_PACKAGES += \
    FontArbutusSourceOverlay \
    FontArvoLatoOverlay \
    FontKaiOverlay \
    FontRubikRubikOverlay \
    FontSamOverlay \
    FontVictorOverlay
