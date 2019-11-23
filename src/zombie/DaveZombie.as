package zombie
{import other.Frames;

import starling.core.Starling;
import starling.display.Image;
import starling.display.MovieClip;
import starling.events.Event;
import starling.textures.Texture;
import starling.utils.deg2rad;

	public class DaveZombie extends Zombie
	{
		
		
		public var speed:uint;
		public var vecShowingFrames:Vector.<Texture>;
		
		
		public var vecArmorShowingframes:Vector.<Texture>=null;
		public var vecArmorWalkingframes:Vector.<Texture>=null;
		public var vecArmorEatingframes:Vector.<Texture>=null;
		
		public var vecWalkingframes:Vector.<Texture>;
		public var vecHandWalkingframes:Vector.<Texture>;
		public var vecinnerHandWalkingframes:Vector.<Texture>;
		public var vecHandEatingframes:Vector.<Texture>;
		public var vecinnerHandEatingframes:Vector.<Texture>;
		public var vecEatingframes:Vector.<Texture>;
		public var IfwearArmor:Boolean=false;
		public var mcArmorMovie:MovieClip;
		public var mcHandMovie:MovieClip;
		public var mcinnerHandMovie:MovieClip;
		public var ArmorMoviex:int=0,ArmorMoviey:int=0;
		public var FellHandimage:Image;
		
		public var bAddedFlag:Boolean = false;
		
		
		public var vecArmorC1Showingframes:Vector.<Texture>=null;
		public var vecArmorC1Walkingframes:Vector.<Texture>=null;
		public var vecArmorC1Eatingframes:Vector.<Texture>=null;
		
		public var vecArmorC2Showingframes:Vector.<Texture>=null;
		public var vecArmorC2Walkingframes:Vector.<Texture>=null;
		public var vecArmorC2Eatingframes:Vector.<Texture>=null;
		
		public function AddFlag():void
		{
			if(MW==1)
			{
				vecinnerHandWalkingframes = Assets.getTextures("DaveZombie_FlagHand_MovingWays","DaveZombie_FlagHand_MovingWaysXML","DaveZombie_FlagHand_MovingWaysFirst");
			}
			else
			{
				vecinnerHandWalkingframes = Assets.getTextures("DaveZombie_FlagHand_MovingWays","DaveZombie_FlagHand_MovingWaysXML","DaveZombie_FlagHand_MovingWaysSecond");
			}
			vecinnerHandEatingframes = Assets.getTextures("DaveZombie_FlagHand_Eating","DaveZombie_FlagHand_EatingXML","DaveZombie_FlagHand_Eating");
			bAddedFlag = true;
		}
		//fuckss--+{};s'w
		private var uifellCount:uint = 0;
		public function FallingArmor(event:Event):void
		{//5.714
			//0.016 rotation = 1
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				uifellCount++;
				if(uifellCount<=10)
				{
					mcArmorMovie.rotation+= deg2rad(1.1);//0.035;
					mcArmorMovie.x+= 2.3;
					mcArmorMovie.y+= 1.6;
					mcArmorMovie.alpha-=0.032;
				}
				if(5<uifellCount<=28)
				{
					mcArmorMovie.rotation+= deg2rad(2.5);//0.1;
					mcArmorMovie.x+= 0.55;
					mcArmorMovie.y+= 3.55;
					mcArmorMovie.alpha-=0.037;
				}
				if(uifellCount>15)
				{
					removeEventListener(Event.ENTER_FRAME,FallingArmor);
					removeChild(mcArmorMovie);
					mcArmorMovie.dispose();
					mcArmorMovie=null;
					IfwearArmor=false;
					return;
				}
				c++;
			}
		}
		public function DaveZombie(num:Number = -1)
		{
			super(num);
			//Max:34,Range:28-34;
			//BeAttackRangex=31.2;
			BeAttackRangex=31.2;
			BeAttackRangey=21.7;
			BeAttackRangewidth=34.7;
			BeAttackRangeheight=109.6;
			AttackRangex=3.8+Math.ceil(Math.random()*10)%4;
			AttackRangey=63.6;
			AttackRangewidth=34.7;
			AttackRangeheight=50.8;
			DetectRangex=27.8;
			DetectRangey=57;
			DetectRangewidth=34.7;
			DetectRangeheight=50.8;
			hurtvalue=1.667;
			Judge="Usual";
			life=182;
			//var bitmap:Bitmap = new ShakingSpriteSheet();
			//var texture:Texture = Texture.fromBitmap(bitmap);
			//var xml:XML = XML(new ShakingSpriteSheetXML());
			//var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			vecShowingFrames = Assets.getTextures("DaveZombie_ShakingFrames","DaveZombie_ShakingXML","DaveZombie_Shaking");//sTextureAtlas.getTextures("DaveZombie_Shaking");
			Walkingframesinit();
			Eatingframesinit();
			mMovie = new MovieClip(vecShowingFrames, 24);
			mMovie.x = 0;
			mMovie.y = 0;
			addEventListener(Event.ENTER_FRAME,FallHandTest);
		}
		private function Eatingframesinit():void
		{
			vecEatingframes = Assets.getTextures("DaveZombie_Eating","DaveZombie_EatingXML","DaveZombie_Eating");
			vecHandEatingframes = Assets.getTextures("DaveZombie_Hand_Eating","DaveZombie_Hand_EatingXML","DaveZombie_Hand_Eating");
			vecinnerHandEatingframes = Assets.getTextures("DaveZombie_innerHand_Eating","DaveZombie_innerHand_EatingXML","DaveZombie_innerHand_Eating");
			//var bitmap:Bitmap = new EatingSpriteSheet();
			//var texture:Texture = Texture.fromBitmap(bitmap);
			//var xml:XML = XML(new EatingSpriteSheetXML());
			//var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			//vecEatingframes = sTextureAtlas.getTextures("DaveZombie_Eating");
		}
		public var MW:uint;
		private function Walkingframesinit():void
		{
			//var bitmap:Bitmap = new WalkingSpriteSheet();
			//var texture:Texture = Texture.fromBitmap(bitmap);
			//var xml:XML = XML(new WalkingSpriteSheetXML());
			//var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			MW=Math.ceil(Math.random()*4)%2;
			if(MW==1)
			{
				vecWalkingframes = Assets.getTextures("DaveZombie_MovingWays","DaveZombie_MovingWaysXML","DaveZombie_MovingWaysFirst");
				vecHandWalkingframes = Assets.getTextures("DaveZombie_Hand_MovingWays","DaveZombie_Hand_MovingWaysXML","DaveZombie_Hand_MovingWaysFirst");
				vecinnerHandWalkingframes = Assets.getTextures("DaveZombie_innerHand_MovingWays","DaveZombie_innerHand_MovingWaysXML","DaveZombie_innerHand_MovingWaysFirst");
			}
			else
			{
				vecWalkingframes = Assets.getTextures("DaveZombie_MovingWays","DaveZombie_MovingWaysXML","DaveZombie_MovingWaysSecond");
			    vecHandWalkingframes = Assets.getTextures("DaveZombie_Hand_MovingWays","DaveZombie_Hand_MovingWaysXML","DaveZombie_Hand_MovingWaysSecond");
				vecinnerHandWalkingframes = Assets.getTextures("DaveZombie_innerHand_MovingWays","DaveZombie_innerHand_MovingWaysXML","DaveZombie_innerHand_MovingWaysSecond");
			}
		}
		public function Curse():void
		{
			for(var i:uint=0;i<this.numChildren;i++)
			{
				if(this.getChildAt(i) is MovieClip)
					Starling.juggler.remove(getChildAt(i));
			}
			//curseImage=new Image(vecShowingFrames[0]);
			curseImageRed=new Image(Assets.getTexture("DaveZombie_Cursed"));
			//removeChild(mMovie);
			//Starling.juggler.remove(mMovie);
			//mMovie.dispose();
			Judge="Dead";
			//curseImage.x=14;
			//curseImage.y=14;
			curseImageRed.x=4;
			curseImageRed.y=13;
			//addChild(curseImage);
			curseImageRed.alpha=0;
			addChild(curseImageRed);
			//if(IfwearArmor)
			//Starling.juggler.remove(mcArmorMovie);
			addEventListener(Event.ENTER_FRAME,curseFrame);
		}
		
		//private var curseImage:Image;
		private var curseImageRed:Image;
		private var curseAlpha:Number=0;
		private function curseFrame(event:Event):void
		{
			if(parent != null && parent.speed != undefined && parent.speed != null)
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				if(curseAlpha<1)
				{
					curseImageRed.alpha+=0.02174;
					for(var i:uint=0;i<this.numChildren;i++)
					{
						if(this.getChildAt(i) is MovieClip)
						{
							if(getChildAt(i).isPlaying)
							{Starling.juggler.remove(getChildAt(i));}
							getChildAt(i).alpha-=0.021;
						}
					}
					curseAlpha+=0.02174;
					if(curseAlpha>1&&IfwearArmor)
					{removeChild(mcArmorMovie);mcArmorMovie.dispose();mcArmorMovie=null;}
				}
				else
				{
					x+=0.745;
					if(width<1.49 && number != null)
					{
						parent.KillZombie(number);
					}
					width-=1.49;
					y+=1.21;
					height-=2.42;
				}
				c++;
			}
		}
		public function Dead():void
		{
			//return;
			/*for(var i:uint = 0; i<this.numChildren; i++)
			{
				if(this.getChildAt(i) is Image||this.getChildAt(i) is MovieClip)
				{
					this.getChildAt(i).filter = null;
				}
			}*/
			addEventListener(Event.ENTER_FRAME,DeadFrame);
		}
		private function DeadFrame(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				alpha-=0.0416;
				if(alpha<0.0416)
				{
					parent.KillZombie(number);
					return;
				}
				c++;
			}
		}
		//fuckyou;'d;';------++++
		public function fellArmor():void
		{
			ArmorJudge="None";
			addEventListener(Event.ENTER_FRAME,FallingArmor);/*
			removeChild(mcArmorMovie);
			mcArmorMovie.dispose();
			mcArmorMovie=null;
			IfwearArmor=false;*/
			
		}
		//fucxjs+_+_+_+_+
		public function WearBuckets():void
		{
			//var bitmap:Bitmap = new ConeShakingSpriteSheet();
			//var texture:Texture = Texture.fromBitmap(bitmap);
			//var xml:XML = XML(new ConeShakingSpriteSheetXML());
			//var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			
			ArmorJudge="Bucket";
			Armorlife = 1000;
			vecArmorShowingframes = Assets.getTextures("DaveZombie_Bucket_Shaking","DaveZombie_Bucket_ShakingXML","DaveZombie_Bucket_Shaking");
			vecArmorC1Showingframes = Assets.getTextures("DaveZombie_Bucket_Charred1_Shaking","DaveZombie_Bucket_Charred1_ShakingXML","DaveZombie_Bucket_Charred1_Shaking");
			vecArmorC2Showingframes = Assets.getTextures("DaveZombie_Bucket_Charred2_Shaking","DaveZombie_Bucket_Charred2_ShakingXML","DaveZombie_Bucket_Charred2_Shaking");
			if(MW==1)
			{
				vecArmorWalkingframes = Assets.getTextures("DaveZombie_Bucket_Shaking","DaveZombie_Bucket_ShakingXML","DaveZombie_Bucket_MovingWaysFirst");
				vecArmorC1Walkingframes = Assets.getTextures("DaveZombie_Bucket_Charred1_Shaking","DaveZombie_Bucket_Charred1_ShakingXML","DaveZombie_Bucket_Charred1_MovingWaysFirst");
				vecArmorC2Walkingframes = Assets.getTextures("DaveZombie_Bucket_Charred2_Shaking","DaveZombie_Bucket_Charred2_ShakingXML","DaveZombie_Bucket_Charred2_MovingWaysFirst");
			}
			else
			{
				vecArmorWalkingframes = Assets.getTextures("DaveZombie_Bucket_Shaking","DaveZombie_Bucket_ShakingXML","DaveZombie_Bucket_MovingWaysSecond");
				vecArmorC1Walkingframes = Assets.getTextures("DaveZombie_Bucket_Charred1_Shaking","DaveZombie_Bucket_Charred1_ShakingXML","DaveZombie_Bucket_Charred1_MovingWaysSecond");
				vecArmorC2Walkingframes = Assets.getTextures("DaveZombie_Bucket_Charred2_Shaking","DaveZombie_Bucket_Charred2_ShakingXML","DaveZombie_Bucket_Charred2_MovingWaysSecond");
			}
			vecArmorEatingframes = Assets.getTextures("DaveZombie_Bucket_Shaking","DaveZombie_Bucket_ShakingXML","DaveZombie_Bucket_Eating");
			vecArmorC1Eatingframes = Assets.getTextures("DaveZombie_Bucket_Charred1_Shaking","DaveZombie_Bucket_Charred1_ShakingXML","DaveZombie_Bucket_Charred1_Eating");
			vecArmorC2Eatingframes = Assets.getTextures("DaveZombie_Bucket_Charred2_Shaking","DaveZombie_Bucket_Charred2_ShakingXML","DaveZombie_Bucket_Charred2_Eating");
			//vecArmorEatingframes = Assets.getTextures("DaveZombie_Cone_Shaking","DaveZombie_Cone_ShakingXML","DaveZombie_Cone_Shaking");
			mcArmorMovie = new MovieClip(vecArmorShowingframes, 24*Extrafps);
			ArmorMoviex=-28;ArmorMoviey=-21;
			IfwearArmor=true;
		}
		public function WearHats():void
		{
			//var bitmap:Bitmap = new ConeShakingSpriteSheet();
			//var texture:Texture = Texture.fromBitmap(bitmap);
			//var xml:XML = XML(new ConeShakingSpriteSheetXML());
			//var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			
			ArmorJudge="Cone";
			Armorlife = 400;
			vecArmorShowingframes = Assets.getTextures("DaveZombie_Cone_Shaking","DaveZombie_Cone_ShakingXML","DaveZombie_Cone_Shaking");
			vecArmorC1Showingframes = Assets.getTextures("DaveZombie_Cone_Charred1_Shaking","DaveZombie_Cone_Charred1_ShakingXML","DaveZombie_Cone_Charreds_Shaking");
			vecArmorC2Showingframes = Assets.getTextures("DaveZombie_Cone_Charred2_Shaking","DaveZombie_Cone_Charred2_ShakingXML","DaveZombie_Cone_Charreds_Shaking");
			if(MW==1)
			{
			    vecArmorWalkingframes = Assets.getTextures("DaveZombie_Cone_Shaking","DaveZombie_Cone_ShakingXML","DaveZombie_Cone_MovingWaysFirst");
				vecArmorC1Walkingframes = Assets.getTextures("DaveZombie_Cone_Charred1_Shaking","DaveZombie_Cone_Charred1_ShakingXML","DaveZombie_Cone_Charreds_MovingWaysFirst");
				vecArmorC2Walkingframes = Assets.getTextures("DaveZombie_Cone_Charred2_Shaking","DaveZombie_Cone_Charred2_ShakingXML","DaveZombie_Cone_Charreds_MovingWaysFirst");
			}
			else
			{
				vecArmorWalkingframes = Assets.getTextures("DaveZombie_Cone_Shaking","DaveZombie_Cone_ShakingXML","DaveZombie_Cone_MovingWaysSecond");
				vecArmorC1Walkingframes = Assets.getTextures("DaveZombie_Cone_Charred1_Shaking","DaveZombie_Cone_Charred1_ShakingXML","DaveZombie_Cone_Charreds_MovingWaysSecond");
				vecArmorC2Walkingframes = Assets.getTextures("DaveZombie_Cone_Charred2_Shaking","DaveZombie_Cone_Charred2_ShakingXML","DaveZombie_Cone_Charreds_MovingWaysSecond");
			}
			vecArmorEatingframes = Assets.getTextures("DaveZombie_Cone_Shaking","DaveZombie_Cone_ShakingXML","DaveZombie_Cone_Eating");
			vecArmorC1Eatingframes = Assets.getTextures("DaveZombie_Cone_Charred1_Shaking","DaveZombie_Cone_Charred1_ShakingXML","DaveZombie_Cone_Charreds_Eating");
			vecArmorC2Eatingframes = Assets.getTextures("DaveZombie_Cone_Charred2_Shaking","DaveZombie_Cone_Charred2_ShakingXML","DaveZombie_Cone_Charreds_Eating");
			//vecArmorEatingframes = Assets.getTextures("DaveZombie_Cone_Shaking","DaveZombie_Cone_ShakingXML","DaveZombie_Cone_Shaking");
			mcArmorMovie = new MovieClip(vecArmorShowingframes, 24*Extrafps);
			ArmorMoviex=-2;ArmorMoviey=-28;
			IfwearArmor=true;
		}
		//I am very handsomejj#$%^&*(;;;;;,kdjeiyth+__+_+_+__+_+_+
		public var blCharred:Boolean=false;
		public var blCharred2:Boolean=false;
		public function CharrTest():void
		{
			if(!blCharred)
			{
				if(ArmorJudge == "Cone")
				{
					if(Armorlife < 267)
					{
						Charred1();
					}
				}
				if(ArmorJudge == "Bucket")
				{
					if(Armorlife < 666)
					{
						Charred1();
					}
				}
			}
			if(!blCharred2)
			{
				if(ArmorJudge == "Cone")
				{
					if(Armorlife < 133)
					{
						Charred2();
					}
				}
				if(ArmorJudge == "Bucket")
				{
					if(Armorlife < 333)
					{
						Charred2();
					}
				}
			}
		}
		private function Charred1(fps:uint=24):void
		{
			var j:uint=mcArmorMovie.currentFrame+1;
			removeChild(mcArmorMovie);
			Starling.juggler.remove(mcArmorMovie);
			blCharred=true;
			vecArmorShowingframes = vecArmorC1Showingframes;
			vecArmorWalkingframes = vecArmorC1Walkingframes;
			vecArmorEatingframes = vecArmorC1Eatingframes;
			
			//var SuddlenlyFrames:Vector.<Texture>;
			if (Judge == "Eating")
			{
				if(j >= 40)
					j = 1;
				//SuddlenlyFrames = new Vector.<Texture>(44, true);
				var i:uint=0;
				mcArmorMovie = new MovieClip(vecArmorEatingframes, 24*Extrafps);
				//mcArmorMovie = new MovieClip(SuddlenlyFrames, fps);
				mcArmorMovie.x=ArmorMoviex+4;mcArmorMovie.y=ArmorMoviey+13;
				addChild(mcArmorMovie);
				Starling.juggler.add(mcArmorMovie);
				mcArmorMovie.currentFrame = j;/*
				for(j; j < 40; j++)
				{
				SuddlenlyFrames[i] = vecArmorC2Eatingframes[j];
				i++;
				}
				j=0;
				for(i; i < 40; i++)
				{
				SuddlenlyFrames[i] = vecArmorC2Eatingframes[j];
				j++;
				}*/
				//SuddlenlyFrames[i]=vecinnerHandEatingframes[i+j];
			}
			if (Judge == "Moving")
			{
				if(j >= 47)
					j = 1;
				//SuddlenlyFrames = new Vector.<Texture>(44, true);
				var i:uint=0;
				mcArmorMovie = new MovieClip(vecArmorWalkingframes, 24*Extrafps);
				//mcArmorMovie = new MovieClip(SuddlenlyFrames, fps);
				mcArmorMovie.x=ArmorMoviex+4;mcArmorMovie.y=ArmorMoviey+13;
				addChild(mcArmorMovie);
				Starling.juggler.add(mcArmorMovie);
				mcArmorMovie.currentFrame = j;/*
				SuddlenlyFrames = new Vector.<Texture>(47, true);
				var i:uint=0;
				var j:uint=mcArmorMovie.currentFrame-1;
				for(j; j < 47; j++)
				{
				SuddlenlyFrames[i] = vecArmorC2Walkingframes[j];
				i++;
				}
				j=0;
				for(i; i < 47; i++)
				{
				SuddlenlyFrames[i] = vecArmorC2Walkingframes[j];
				j++;
				}*/
			}
			
			if(ArmorJudge == "Bucket")
			{
				mcArmorMovie.x=-20;
				mcArmorMovie.y=1;
			}
		}
		//_+_+_+_+_+_+
		private function Charred2(fps:uint=24):void
		{
			var j:uint=mcArmorMovie.currentFrame+1;
			removeChild(mcArmorMovie);
			Starling.juggler.remove(mcArmorMovie);
			blCharred2=true;
			vecArmorShowingframes = vecArmorC2Showingframes;
			vecArmorWalkingframes = vecArmorC2Walkingframes;
			vecArmorEatingframes = vecArmorC2Eatingframes;
			
			//var SuddlenlyFrames:Vector.<Texture>;
			if (Judge == "Eating")
			{
				if(j == 41)
					j = 1;
				if(j == 40)
					j = 39;
				//SuddlenlyFrames = new Vector.<Texture>(44, true);
				var i:uint=0;
				mcArmorMovie = new MovieClip(vecArmorEatingframes, 24*Extrafps);
				//mcArmorMovie = new MovieClip(SuddlenlyFrames, fps);
				mcArmorMovie.x=ArmorMoviex+4;mcArmorMovie.y=ArmorMoviey+13;
				addChild(mcArmorMovie);
				Starling.juggler.add(mcArmorMovie);
				mcArmorMovie.currentFrame = j;/*
				for(j; j < 40; j++)
				{
					SuddlenlyFrames[i] = vecArmorC2Eatingframes[j];
					i++;
				}
				j=0;
				for(i; i < 40; i++)
				{
					SuddlenlyFrames[i] = vecArmorC2Eatingframes[j];
					j++;
				}*/
				//SuddlenlyFrames[i]=vecinnerHandEatingframes[i+j];
			}
			if (Judge == "Moving")
			{
				if(j >= 48)
					j = 1;
				//SuddlenlyFrames = new Vector.<Texture>(44, true);
				var i:uint=0;
				mcArmorMovie = new MovieClip(vecArmorWalkingframes, 24*Extrafps);
				//mcArmorMovie = new MovieClip(SuddlenlyFrames, fps);
				mcArmorMovie.x=ArmorMoviex+4;mcArmorMovie.y=ArmorMoviey+13;
				addChild(mcArmorMovie);
				Starling.juggler.add(mcArmorMovie);
				mcArmorMovie.currentFrame = j;/*
				SuddlenlyFrames = new Vector.<Texture>(47, true);
				var i:uint=0;
				var j:uint=mcArmorMovie.currentFrame-1;
				for(j; j < 47; j++)
				{
					SuddlenlyFrames[i] = vecArmorC2Walkingframes[j];
					i++;
				}
				j=0;
				for(i; i < 47; i++)
				{
					SuddlenlyFrames[i] = vecArmorC2Walkingframes[j];
					j++;
				}*/
			}
			if(ArmorJudge == "Bucket")
			{
				mcArmorMovie.x=-7;
			    mcArmorMovie.y=2.5;
			}
			//mcArmorMovie = new MovieClip(SuddlenlyFrames, fps);
			//mcArmorMovie.x=ArmorMoviex+4;mcArmorMovie.y=ArmorMoviey+13;
			//mcArmorMovie.x=ArmorMoviex-10000;mcArmorMovie.y=ArmorMoviey;
			//addChild(mcArmorMovie);
			Starling.juggler.add(mcArmorMovie);
		}
		public function intoParts():Array
		{
			this.Eat();
			var R:Array = new Array();
			R[0] = new Frames(vecinnerHandEatingframes);
			R[1] = new Frames(vecEatingframes);
			R[2] = new Frames(vecHandEatingframes);
			if(vecArmorEatingframes != null)
			R[3] = new Frames(vecArmorEatingframes);
			var R2:Array = new Array();
			R2[0] = this.mcinnerHandMovie.x;
			R2[1] = this.mMovie.x;
			R2[2] = this.mcHandMovie.x;
			if(mcArmorMovie != null)
			R2[3] = this.mcArmorMovie.x;
			var R3:Array = new Array();
			R3[0] = this.mcinnerHandMovie.y;
			R3[1] = this.mMovie.y;
			R3[2] = this.mcHandMovie.y;
			if(mcArmorMovie != null)
			R3[3] = this.mcArmorMovie.y;
			var R4:Array = new Array();
			R4[0] = R;
			R4[1] = R2;
			R4[2] = R3;
			return R4;
		}
		public function Show(fps:uint=24):void
		{
			removeChild(mMovie);
			Starling.juggler.remove(mMovie);
			mMovie.dispose();
			mMovie = new MovieClip(vecShowingFrames, fps*Extrafps);
			// centers the MovieClip
			mMovie.x = 0;
			mMovie.y = 0;
			// show it
			addChild ( mMovie );
			Starling.juggler.add(mMovie);
			if(IfwearArmor)
			{removeChild(mcArmorMovie);mcArmorMovie.dispose();mcArmorMovie = new MovieClip(vecArmorShowingframes, fps*Extrafps);mcArmorMovie.x=ArmorMoviex;mcArmorMovie.y=ArmorMoviey;addChild(mcArmorMovie);Starling.juggler.add(mcArmorMovie);}
		}
		public function FallHand(fps:uint=24):void
		{
			vecHandEatingframes = Assets.getTextures("DaveZombie_brokeHand_Eating","DaveZombie_brokeHand_EatingXML","DaveZombie_brokeHand_Eating");
			if(MW==1)
				vecHandWalkingframes = Assets.getTextures("DaveZombie_brokeHand_MovingWays","DaveZombie_brokeHand_MovingWaysXML","DaveZombie_brokeHand_MovingWaysFirst");
			else
				vecHandWalkingframes = Assets.getTextures("DaveZombie_brokeHand_MovingWays","DaveZombie_brokeHand_MovingWaysXML","DaveZombie_brokeHand_MovingWaysSecond");
			//vecHandEatingframes = Assets.getTextures("DaveZombie_brokeHand_MovingWays","DaveZombie_brokeHand_MovingWaysXML","DaveZombie_brokeHand_MovingWays");
			FellHandimage = new Image(mcHandMovie.getFrameTexture(mcHandMovie.currentFrame));
			addChild(FellHandimage);
			FellHandimage.x = mcHandMovie.x;
			FellHandimage.y = mcHandMovie.y;
			//var SuddlenlyFrames:Vector.<Texture>;
			var currentFrameBegin:uint;
			currentFrameBegin = mcHandMovie.currentFrame;
			Starling.juggler.remove(mcHandMovie);
			removeChild(mcHandMovie);
			mcHandMovie.dispose();
			if (Judge == "Eating")
			{
				if(currentFrameBegin == 41)
					currentFrameBegin = 1;
			    mcHandMovie = new MovieClip(vecHandEatingframes, fps*Extrafps);
				/*SuddlenlyFrames = new Vector.<Texture>(40, true);
				var i:uint=0;
				var j:uint=;
				for(j; j < 40; j++)
				{
					SuddlenlyFrames[i] = vecHandEatingframes[j];
					i++;
				}
				j=0;
				for(i; i < 40; i++)
				{
					SuddlenlyFrames[i] = vecHandEatingframes[j];
					j++;
				}
				mcHandMovie = new MovieClip(SuddlenlyFrames, fps*Extrafps);*/
				mcHandMovie.x = 43.4;
				mcHandMovie.y = 56;
				addChild(mcHandMovie);
				Starling.juggler.add(mcHandMovie);
				mcHandMovie.currentFrame = currentFrameBegin;
				//SuddlenlyFrames[i]=vecinnerHandEatingframes[i+j];
			}
			if (Judge == "Moving")
			{
				if(currentFrameBegin == 48)
					currentFrameBegin = 1;
				mcHandMovie = new MovieClip(vecHandWalkingframes, fps*Extrafps);
				SuddlenlyFrames = new Vector.<Texture>(47, true);
				var i:uint=0;
				var j:uint=mcHandMovie.currentFrame;
				for(j; j < 47; j++)
				{
					SuddlenlyFrames[i] = vecHandWalkingframes[j];
					i++;
				}
				j=0;
				for(i; i < 47; i++)
				{
					SuddlenlyFrames[i] = vecHandWalkingframes[j];
					j++;
				}
				mcHandMovie = new MovieClip(vecHandWalkingframes, fps*Extrafps);
				mcHandMovie.x = 37;
				mcHandMovie.y = 55;
				addChild(mcHandMovie);
				Starling.juggler.add(mcHandMovie);
				mcHandMovie.currentFrame = currentFrameBegin;
			}
			addEventListener(Event.ENTER_FRAME,FallHandFrame);
		}
		public var FallTime:int = 0;
		public function FallHandFrame(e:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				FallTime++;
				FellHandimage.y+=1.7;
				FellHandimage.alpha-=0.1;
				if(FallTime >= 10)
				{
					FellHandimage.visible = false;
					removeChild(FellHandimage);
					FellHandimage.dispose();
					removeEventListener(Event.ENTER_FRAME,FallHandFrame);
					return;
				}
				c++;
			}
		}
		private function FallHandTest(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				CharrTest();
				if(life<83)
				{
					removeEventListener(Event.ENTER_FRAME,FallHandTest);
					FallHand();
					return;
				}
				c++;
			}
		}
		public function Eat(fps:uint=24):void
		{
			if(Judge=="Dead"||life<=0)
				return;
			Judge="Eating";
			removeChild(mcinnerHandMovie);
			Starling.juggler.remove(mcinnerHandMovie);
			mcinnerHandMovie = new MovieClip(vecinnerHandEatingframes, fps);
			if(!bAddedFlag)
			{
			    mcinnerHandMovie.x = -3.2;
			    mcinnerHandMovie.y = 44;
			}
			else
			{
				mcinnerHandMovie.x = -17;
				mcinnerHandMovie.y = -57;
			}
			addChild(mcinnerHandMovie);
			Starling.juggler.add(mcinnerHandMovie);
			removeChild(mMovie);
			Starling.juggler.remove(mMovie);
			mMovie.dispose();
			mMovie = new MovieClip(vecEatingframes, fps);
			// centers the MovieClip
			mMovie.x = -5;
			mMovie.y = 13;
			// show it
			addChild ( mMovie );
			Starling.juggler.add(mMovie);
			////////////////////////////////////////////////
			removeChild(mcHandMovie);
			Starling.juggler.remove(mcHandMovie);
			mcHandMovie = new MovieClip(vecHandEatingframes, fps);
			if(life<83)
			{
			    mcHandMovie.x=43;
			    mcHandMovie.y=58;
			}
			else
			{
				mcHandMovie.x=5.3;
				mcHandMovie.y=46;
			}
			addChild(mcHandMovie);
			Starling.juggler.add(mcHandMovie);
			///////////////////////////////////////////////
			//if(IfwearArmor)
			//{removeChild(mcArmorMovie);mcArmorMovie.dispose();mcArmorMovie = new MovieClip(vecArmorEatingframes, fps);mcArmorMovie.x=ArmorMoviex+4;mcArmorMovie.y=ArmorMoviey+15;addChild(mcArmorMovie);Starling.juggler.add(mcArmorMovie);}
			if(IfwearArmor)
			{
				removeChild(mcArmorMovie);
				mcArmorMovie.dispose();
				mcArmorMovie = new MovieClip(vecArmorEatingframes, fps);
				mcArmorMovie.x=ArmorMoviex+4;
				mcArmorMovie.y=ArmorMoviey+15;
				if(ArmorJudge == "Bucket")
				{
					if(Armorlife < 666 && Armorlife >= 333)
					{
						mcArmorMovie.x=-24;
						mcArmorMovie.y=13.5;
					}
					if(Armorlife < 333)
					{
						mcArmorMovie.x=-12;
						mcArmorMovie.y=12.5;
					}
				}
				addChild(mcArmorMovie);
				Starling.juggler.add(mcArmorMovie);
			}
			removeEventListener(Event.ENTER_FRAME,WalkFrame);
		}
		public function Walk(fps:uint=24):void
		{
			if(Judge=="Dead"||life<=0)
				return;
			Judge="Moving";
			removeChild(mMovie);
			Starling.juggler.remove(mMovie);
			mMovie.dispose();
			removeChild(mcinnerHandMovie);
			Starling.juggler.remove(mcinnerHandMovie);
			//mcinnerHandMovie.dispose();
			mcinnerHandMovie = new MovieClip(vecinnerHandWalkingframes, fps*Extrafps);
			if(!bAddedFlag)
			{
			    mcinnerHandMovie.x = 13;
			    mcinnerHandMovie.y = 43;
			}
			else
			{
				mcinnerHandMovie.x = -22;
				mcinnerHandMovie.y = -63;
			}
			addChild(mcinnerHandMovie);
			Starling.juggler.add(mcinnerHandMovie);
			mMovie = new MovieClip(vecWalkingframes, fps*Extrafps);
			// centers the MovieClip
			mMovie.x = 0;
			mMovie.y = 0;
			// show it
			addChild ( mMovie );
			Starling.juggler.add(mMovie);
			removeChild(mcHandMovie);
			Starling.juggler.remove(mcHandMovie);
			if(mcHandMovie!=null)
			mcHandMovie.dispose();
			mcHandMovie = new MovieClip(vecHandWalkingframes, fps*Extrafps);
			if(life<83)
			{
			    mcHandMovie.x=37;
			    mcHandMovie.y=55;
			}
			else
			{
				mcHandMovie.x=17;
				mcHandMovie.y=56;
			}
			addChild(mcHandMovie);
			Starling.juggler.add(mcHandMovie);
			if(IfwearArmor)
			{
				removeChild(mcArmorMovie);
				mcArmorMovie.dispose();
				mcArmorMovie = new MovieClip(vecArmorWalkingframes, fps*Extrafps);
				mcArmorMovie.x=ArmorMoviex+4;
				mcArmorMovie.y=ArmorMoviey+13;
				if(ArmorJudge == "Bucket")
				{
					if(Armorlife < 666 && Armorlife >= 333)
					{
						mcArmorMovie.x=-20;
						mcArmorMovie.y=1;
					}
					if(Armorlife < 333)
					{
						mcArmorMovie.x=-7;
						mcArmorMovie.y=2.5;
					}
				}
				addChild(mcArmorMovie);
				Starling.juggler.add(mcArmorMovie);
			}
			addEventListener(Event.ENTER_FRAME,WalkFrame);
		}
		private function WalkFrame(e:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
			    x-=0.666;
				c++;
			}
		}
	}
}