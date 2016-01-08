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

import info.heriet.gizac.command.PsdCommand;
import info.heriet.gizac.command.GifCommand;

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
                var command = new PsdCommand();
                command.execute(params);
            case "gif":
                var command = new GifCommand();
                command.execute(params);
            default:
                printUsage();
        }
	}
    
    static function printUsage()
    {
        Lib.println("Usage: gizac <command> image-file...");
        Lib.println("");
        Lib.println("Commands:");
        Lib.println("  gif      Convert edg/gal to gif");
        Lib.println("  psd      Convert edg/gal to psd");
    }
	
}