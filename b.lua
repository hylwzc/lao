-- sprite=require("a")
-- sprite:Show()--冒号的时候self不需要场地参数.的时候需要传递参数
-- sprite.SetPosition(sprite,100,200)
-- sprite.Show(sprite)
-- sprite:move()
-- sprite:Show()

-- person=require("a")
-- person:setPosition("dage",90900,"男")
--  person:Show()
-- print(person.getName())
--继承
--[[Hero={attack=0}
function Hero:new(l)
	l=l or{}
	setmetatable(l,self)
	self.__index=self
	return l
	-- body
end
function Hero:skill(addAttack)
	self.attack=self.attack +addAttack
end
--继承
oneHero=Hero:new({attack=100})
oneHero:skill(10)
print(oneHero.attack)
function oneHero:test()
	print("test");
end
function oneHero:injured(loseAttack)
	-- if loseAttack>self.attack then
	-- 	error"not engouth attack"
	-- end
	self.attack=self.attack-loseAttack/2	
end
oneHero:injured(100)
 print(oneHero.attack)-->60
 oneHero:test()--]]


 -- local child = dofile("a.lua")
 -- local c = child:new()
 -- c:setBalance(10)
 -- c:test()
 --私有的
 --[[function createTSprite()
 	local Young = {name="myname"}
 	local function myBus() 
 		print("myBus")
 		end
 		local function MyGame()
 			print("MyGame")
 		end
 	local function hello()
 		print("hello")
 		myBus()
 	end 
 	local function hi( )
 		print("hi:")
 		MyGame()
 	end
 	local function setName(newName )
 		Young.name=newName
 	end
 	local function getName( )
 	return Young.name
 	end 
 	--对外开放的函数
 	return{hello=hello,hi=hi,setName=setName,getName=getName}
 end
 local sp = createTSprite()
  sp.setName("really")
 print(sp.getName())
 sp.hello()
 sp.MyGame()
--]]

 function seatch(classes,key)
 	for i=1,#classes do
 		local value = classes[i][key]
 		if value ~=nil then
 			return value
 		end
 	end
 	end
 	local t1 = {game1="game11"}
 	local t2 = {game2="game2"}
 	print(seatch({t1,t2},"game2"))
 	function createClass( ... )
 		local parents = {...}
 		local child = {}
 		setmetatable(child,{
 			__index=function (table,key)
 			return seatch(parents,key)
 			end
 			})
 	function child:new( )
 		o={}
 		setmetatable(o,child)
 		child.__index=child
 		return o

 	end
 	return child
 	end
 	TSprite{}
 	function TSprite:hello( )
 		print("Ts")
 	end
 	function TSprite:new( o )
 		o={}
 		setmetatable(o,self)
 		self.__index=self
 		return o
 		end
        TBullet={}
        function  TBullet:fire( )
        	print("Tb")
        end
        function TBullet:new( )
        	o={}
        	setmetatable(o,self)
        	self.__index=self
        	return o
        end
 		TCreate={}

 		function TCreate:doit()
 			print("Tc")
 		end
 		function TCreate:new()
 			o={}
        	setmetatable(o,self)
        	self.__index=self
        	return o
 		end
 		local  BulletSprite =createClass(TSprite,TBullet,TCreate)
 		local Bsprite = BulletSprite::new()
 		Bsprite.hello()
 		Bsprite.f.ire()
 		Bsprite.doit()
 	