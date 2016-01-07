// admins on all servers
VGServerStats = ["",[]];
_LAdmins = [];
_NAdmins = 
[];
_SAdmins = 
[];

if (vgserver in ["OverpochCherno1","EpochCherno1","devserver"]) then 
{
	_LAdmins = _LAdmins +	[];
	_NAdmins = _NAdmins +	[];
	_SAdmins = _SAdmins +	[];
	VGServerStats set [0,"94.23.216.94:2402"];
	VGServerStats set [1,[]];
};
if (vgserver == "EpochCherno1") then 
{
	_LAdmins = _LAdmins +	[];
	_NAdmins = _NAdmins +	[];
	_SAdmins = _SAdmins +	[];
	VGServerStats set [0,"91.121.146.7:2302"];
	VGServerStats set [1,[]];
};
if (vgserver  == "OverpochTavi1") then 
{
	_LAdmins = _LAdmins +	[];
	_NAdmins = _NAdmins +	[];
	_SAdmins = _SAdmins +	[];
	VGServerStats set [0,"91.121.146.7:2310"];
	VGServerStats set [1,[]];
};
if (vgserver  == "OverpochPanthera1") then 
{
	_LAdmins = _LAdmins +	[];
	_NAdmins = _NAdmins +	[];
	_SAdmins = _SAdmins +	[];
	VGServerStats set [0,"91.121.146.7:2303"];
	VGServerStats set [1,[]];
};

VG_ADMINS = _SAdmins + _NAdmins + _LAdmins + ["76561198033634496"];

//Copy all donator uids here (For security reasons)
VG_DONATORS =
[];
VG_DONATORS = VG_DONATORS + VG_ADMINS;

VG_BANNED = 
[ 
	"76561198147162578","76561198114026184","76561198066244502","76561198028763557",
	"76561198149627656","76561198160080774","76561198045332479","76561198070087590",
	"76561197988429430","76561198168034073","76561198055694097","76561198028329627",
	"76561198102358630","76561198090028560","76561198171605962","76561198137544073",
	"76561197972762395","76561198080176605"
];