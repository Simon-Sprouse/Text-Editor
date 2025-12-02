#include <iostream>
#include <fstream>
#include <QApplication>
#include <QLabel>
#include "include/core/SkSurface.h"
#include "include/core/SkImage.h"
#include "include/core/SkCanvas.h"
#include "include/core/SkData.h"
#include "include/core/SkStream.h"
#include "include/core/SkFont.h"
#include "include/core/SkBitmap.h"
#include "include/encode/SkPngEncoder.h"

int main(int argc, char* argv[]) {
    // 1. Create a bitmap and get a canvas from it
    SkBitmap bitmap;
    SkImageInfo info = SkImageInfo::MakeN32Premul(800, 600);
    bitmap.allocPixels(info);
    
    SkCanvas canvas(bitmap);
    
    // 2. Clear canvas to white
    canvas.clear(SK_ColorWHITE);

    // 2.5 Draw rectangle
    SkPaint rectPaint;
    rectPaint.setColor(SK_ColorRED);
    canvas.drawRect(SkRect::MakeXYWH(50, 50, 200, 100), rectPaint);
    
    // 3. Draw text
    SkPaint paint;
    paint.setColor(SK_ColorBLACK);
    paint.setAntiAlias(true);
    
    SkFont font(nullptr, 48); // default typeface, size 48
    canvas.drawString("Hello, Skia!", 100, 200, font, paint);
    
    // 4. Encode as PNG using SkPixmap
    SkPixmap pixmap;
    if (!bitmap.peekPixels(&pixmap)) {
        std::cerr << "Failed to get pixmap.\n";
        return 1;
    }
    
    // Encode to PNG
    {
        SkFILEWStream out("test.png");
        SkPngEncoder::Options options;
        if (!SkPngEncoder::Encode(&out, pixmap, options)) {
            std::cerr << "Failed to encode PNG.\n";
            return 1;
        }
        out.flush();
        // Stream will be closed when it goes out of scope
    }
    
    std::cout << "Wrote test.png\n";
    
    // 5. Qt GUI
    QApplication app(argc, argv);
    QLabel label("Hello, Static Qt + Skia!");
    label.resize(400, 100);
    label.show();
    
    return app.exec();
}