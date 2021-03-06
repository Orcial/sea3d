/*
*
* Copyright (c) 2013 Sunag Entertainment
*
* Permission is hereby granted, free of charge, to any person obtaining a copy of
* this software and associated documentation files (the "Software"), to deal in
* the Software without restriction, including without limitation the rights to
* use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
* the Software, and to permit persons to whom the Software is furnished to do so,
* subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
* FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
* COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
* IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
* CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
*/

package sunag.sea3d.objects
{
	import flash.utils.ByteArray;
	
	import sunag.sea3d.SEA;
	
	public class SEASkeletonAnimation extends SEAAnimationBase
	{
		public static const TYPE:String = "skla";
		
		public var pose:Array;
		public var count:uint;
		
		public function SEASkeletonAnimation(name:String, sea:SEA)
		{
			super(name, TYPE, sea);
		}	
		
		protected override function readBody(data:ByteArray):void
		{
			var i:int, j:int, joint:Array;
						
			count = data.readUnsignedShort();			
			
			pose = [];
			pose.length = numFrames;
			
			for(i=0;i<numFrames;i++)			
			{
				joint = [];
				joint.length = count;
				
				for(j=0;j<count;j++)
				{
					joint[j] = 
						{
							// POSITION XYZ
							x:data.readFloat(),
							y:data.readFloat(),
							z:data.readFloat(),
							// QUATERNION XYZW
							qx:data.readFloat(),
							qy:data.readFloat(),
							qz:data.readFloat(),
							qw:data.readFloat()
						};
				}
				
				pose[i] = joint;
			}
		}
	}
}