class craftingSystem
{
    class craftingConfig
    {
        masterItemList[] = {"GasMask", "MRCO", "Aimpoint3x", "Shortdot"};

        class GasMask {
        	classname = "Mask_M40";
        	displayname = "Gas Mask";
        	itemdescription = "The gas mask is a useful tool in committing crime! Keep your face concealed and keep that tear gas out of your lungs!";

        	ironreq = 4;
        	cottonreq = 0;
        	glassreq = 2;
        	copperreq = 0;
            diamondreq = 0;
        };

        class MRCO {
        	classname = "optic_MRCO";
        	displayname = "MRCO Optic";
        	itemdescription = "The MRCO is a medium range scope designed for marksman usage with an Assault Rifle! Perfect for tapping cops from the upper floors of bank!";

        	ironreq = 1;
        	cottonreq = 0;
        	glassreq = 1;
        	copperreq = 0;
            diamondreq = 0;
        };

        class Aimpoint3x {
            classname = "FHQ_optic_AimM_BLK";
            displayname = "3x Aimpoint";
            itemdescription = "The 3x Aimpoint provides the benefits of the close range highly effective aimpoint, but being more long range capable, with a secondary zoom scope. WARNING: You cannot disable the secondary zoom, so have a short range scope ready!";

            ironreq = 5;
            cottonreq = 0;
            glassreq = 5;
            copperreq = 0;
            diamondreq = 0;
        };

        class Shortdot {
            classname = "CUP_optic_SB_11_4x20_PM";
            displayname = "S&B Shortdot";
            itemdescription = "The Shortdot by Schmidt and Bender provides a strong medium range capability for those of us lucky enough to have assault rifles and excels in the field of rebellions!";

            ironreq = 5;
            cottonreq = 0;
            glassreq = 5;
            copperreq = 0;
            diamondreq = 2;
        };
    };
};