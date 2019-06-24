/*
 * Copyright (c) heriet [http://heriet.info/].
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package info.heriet.gizac.command;

import cpp.Lib;
import cpp.link.StaticStd;
import cpp.link.StaticRegexp;

import haxe.io.Bytes;
import hxpixel.images.edg.EdgDecoder;
import hxpixel.images.gal.GalDecoder;
import hxpixel.images.file.PixelArtFileType;
import hxpixel.images.psd.PsdConverter;
import hxpixel.images.psd.PsdEncoder;
import hxpixel.images.utils.FileUtils;

import sys.FileSystem;
import sys.io.File;

class PsdCommand 
{
    public function new() {
        
    }
    
    public function execute(params: Array<String>)
    {
        for (filePath in params) {
            
            if (!validFile(filePath)) {
                continue;
            }
            
            var fileBytes = File.getBytes(filePath);
            convert(filePath, fileBytes);
        }
    }
    
    function validFile(src:String):Bool
    {
        if (!FileSystem.exists(src)) {
            Lib.println("File not found");
            return false;
        }
        
        if (FileSystem.isDirectory(src)) {
            Lib.println("File is Directory");
            return false;
        }
        
        return true;
    }

    function convert(filePath:String, fileBytes: Bytes)
    {
        var fileType = FileUtils.distinctPixelArtFileType(fileBytes);
        
        switch(fileType) {
            case PixelArtFileType.Edge:
                convertEdgToPsd(filePath, fileBytes);
                
            case PixelArtFileType.Gale:
                convertGalToPsd(filePath, fileBytes);
                
            default:
                Lib.println("Invalid File");
        }
    }
    
    function convertEdgToPsd(filePath:String, fileBytes: Bytes)
    {
        var edgImage = EdgDecoder.decode(fileBytes);
        var psdImage = PsdConverter.convertFromEdg(edgImage);
        var psdBytes = PsdEncoder.encode(psdImage);
        
        var reg = ~/\.[0-9a-zA-Z]+$/;
        var dest = reg.replace(filePath, "") + ".psd";
        
        var file = File.write(dest);
        file.write(psdBytes);
        file.close();
        
        Lib.println("convert psd: " + filePath + " => "+ dest);
    }
    
    function convertGalToPsd(filePath:String, fileBytes: Bytes)
    {
        var galImage = GalDecoder.decode(fileBytes);
        var psdImage = PsdConverter.convertFromGal(galImage);
        var psdBytes = PsdEncoder.encode(psdImage);
        
        var reg = ~/\.[0-9a-zA-Z]+$/;
        var dest = reg.replace(filePath, "") + ".psd";
        
        var file = File.write(dest);
        file.write(psdBytes);
        file.close();
        
        Lib.println("convert psd: " + filePath + " => "+ dest);
    }
}