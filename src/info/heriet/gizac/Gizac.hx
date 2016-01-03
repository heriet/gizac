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

package info.heriet.gizac;

import cpp.Lib;
import hxcpp.StaticStd;
import hxcpp.StaticRegexp;

import sys.FileSystem;
import sys.io.File;

import hxpixel.images.edg.EdgImage;
import hxpixel.images.edg.EdgDecoder;
import hxpixel.images.psd.PsdConverter;
import hxpixel.images.psd.PsdEncoder;

class Gizac 
{
	
	static function main() 
	{
        var args = Sys.args();
        
        if (args.length < 2) {
            printUsage();
            return;
        }
        
        var command = args[0];
        var params = args.slice(1);
        
        switch(command) {
            case "psd":
                convertPsd(params);
            default:
                printUsage();
        }
	}
    
    static function convertPsd(params:Array<String>)
    {
        for (param in params) {
            convertEdgToPsd(param);
        }
    }
    
    static function convertEdgToPsd(src:String)
    {
        if (!FileSystem.exists(src)) {
            throw "File not found";
        }
        
        if (FileSystem.isDirectory(src)) {
            throw "File is Directory";
        }
        
        var edgBytes = File.getBytes(src);
        var edgImage = EdgDecoder.decode(edgBytes);
        
        var psdImage = PsdConverter.convertFromEdg(edgImage);
        var psdBytes = PsdEncoder.encode(psdImage);
        
        var reg = ~/\.edg+$/;
        var dest = reg.replace(src, "") + ".psd";
        
        var file = File.write(dest);
        file.write(psdBytes);
        file.close();
        
        Lib.println("convert psd: " + src + " => "+ dest);
    }
    
    static function printUsage()
    {
        Lib.println("usage: gizac psd xxx.edg");
    }
    
    static function removeExtension(fileName : String) : String
    {
        var reg = ~/\.[0-9a-zA-Z]+$/;
        return reg.replace(fileName, "");
    }
	
}