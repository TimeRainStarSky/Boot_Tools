#脚本已经过编译，需要源代码请联系作者：时雨丶星空
if [ "$(id -u)" != 0 ];then echo "[1;33m- 正在获取root权限[m";su -c "sh \"$0\" \"$@\"";exit;fi;MAGISKPATH="$(magisk --path)";PATH="$PATH:/data/adb/magisk:$MAGISKPATH:$MAGISKPATH/.magisk/busybox";[ "$0" != "${0%/*}" ]&&cd "${0%/*}";FILE="${0##*/}";EXEC="/data/adb/Boot_Tools.sh.x";abort(){ echo "[1;31m! $@[m";exit 1;};output_file(){ echo "[1;33m- 正在释放脚本[m";sed "1,2d" "$FILE"|unxz>"$EXEC"||abort "脚本释放失败";chmod 555 "$EXEC"||abort "脚本权限修改失败";OUTPUT=1;};check_exec(){ if [ -x "$EXEC" ]&&[ "$(md5sum "$EXEC"|head -c 32)" = "5af8ecb34ba74ec0db3e4dafda516f04" ];then echo "[1;32m- 脚本校验成功，开始执行[m";"$EXEC" "$(pwd)" "$FILE"||abort "脚本执行失败";elif [ -z "$OUTPUT" ];then output_file;check_exec;else abort "脚本释放失败";fi;};check_exec;exit
�7zXZ  �ִF !   �X��u�_] ?�E�h=��ڊ�"����F�7�cY��+�:�#�Y=_��'�n�	�;M�`h}Ȍ��gӻ����Ø�'���;B�خv���F/��b���Y�<'�wb��:��ِ�:�f�~"�&a�<w��Y��RΜ���\oP���V�z[Zh6�"���s�(���j��dʻ�+�M����\g*�z������8:��Yު�����q�%UJ��Ҫ��!��;�q\bPg8~~aŽ�����ɯD�Q!��̿S��d�&��XLߛ���XM��^T_�6�bj�rg�C�N��'8��q1�e�]��uuM�B��kuBUq4V,*�4̌����C	$Z ����Z�9B,��l,�2��
E��I
�<+�Xc�1!6%A�@�LgG>滉�p���I1D�`A��4ȗ���/{P��Oˣ6�5H��u �Z�O�)ڌQ�u����L�(���sטș˧�R�C����>�L��*_����>?��Ó��K�v�R�D(_��.H?��\���y L���JY�͂����8�6:�:,�i]"ţ;�����]|^̃Z"@��,��O��9�4���.S:ͣ~+܃!������6�����1�A�tt����d|1h*�ڕ��y'4ͺ�)�cͽX���O@�F䠱�ְm��TJ�A��!ȋ�]�Ċ�gG��R
e�NN-�>X�, u���"np�d9 [q0�.j^$d�	N6�5ME X�����Y�B?��;J��nR���f�ug���Ez�4��*%��޻�cY������y���d�,0��9=�M3�#�>x�l_R��"���~�Ns+R��T���/x�8�HtvBRГ��L����v��hz�F�@ѭK�����;W�W�󡇁���2��"U��|P�e*G��.~������o���?��C��9�ނ���]��u�P�#��X���@�1���o��+���83�.~})������l����4��iN�=���^��Ki���[������a5�l�p���@�����M�=���v9�o|E���?F[��g���C��g��#��#�%�w��l�o~�,����Y4DTC��^j(~H9�}� t��y��Wu��.^]q�I&F�Cj�5*Z�H�[�痮���
M��*���{ �Mn��Dwī�S0��hA$�tE�#�ϿI�\^�L=<s����r�[�R:~�T�Ⱥ	0��/��9W��	W�o!�˖K��C�!<Z�$��*R����ۜ8�Za<�'<X�w>��^�8踧���l�0?n�q��He������%��݋�ج�Ҧ���X�U]��Nh�G
hN�ޓT�����`�j�!�b�Ǧ19�4	�́���������g�P�aq��'�l���W;M�j�P�Q��q�t������@G�v�IMRR��������*HB����~qV�۲X��Z4l����h�%��RRW����Ow��ú�|U�E+�:�3o�;��x}��nT�C�/�1}^��4i��zJ���k��d.�Q&2���)�T�]�����!\���ouP�&D��3��ᮛ�	}ʿ�|��ȍ�'�5�,]����QO��GW�����H��a��X�r$.�K���O��G]��B�HZ�
����9O��(Z���{�����ܗ�ٳ�*�G.�2Ï�$��Y�aVCO]0,�_ҫs+�vrO0�{~.�LA��P_^� ��;4�Og�Q�I����]����k��X�)YƟR��y�`$�J�ls#��\y��Vͳ��G�S����G<��\�T��� ��M�v�3�T�MY ���w���-�D*���m&��ȯ��̷^}Ȓ(���@̾[�~S	\��꓃�lK�	/���B��a.El�>�¹�8�*��JZA{�؎0�Wƌ������Q��Ǟ�ؔ�y#�PfOϛ����F���]��u�U��������b���I����B@�
��9I���[1h�J�i��ƈ�S���ƒB�'��Rz������"7����ɿg�|�K{���s�^��b��L�0�!�l7�t?�|O�эo��^�	k붟��^}3��
F�;VG��q@o��Sxx�ϭ�%FO�Ob0F�h�J{��<�����]Q�=y �csF��{#�ѐ��`<�\��"�4#�K� ��4~)��v��`To�R�=\*;�'��Ǵ⃅QtW#%?�6'Ūp��z�҈e{�ּ��8r���2�@�J��Ô(��i��񙎍���(r�Y�L����k�����;�؋��SƳ|O��j}iI�X�z�F��J�]�laȡ���G2">��W�x*�l8�8"�F� �4�qF��'���ې;	�$W�oB�gh�í��3�r/~�kLrQ���L:��g�BH��=^DPD��˛�ӟ0�y.����H�+�^��G��$5_���w�����*[?ſ��؇�Zhl^H�g:�p
%����r2#���"z��3��Zlp����;�IQ����e����h���85�N�<f�Ӊ�;H?IP����4�G�I�~]�.�v��G���jm�N�0ƼZ(�ޫ[�� �0<
�*�_Cou`����n�qL��T�@�A�p0z����'�7c)�>��Z�7>VҴ���x���9p
Y�\FDb���q]D0�Q��2�&H�NI�/��8)2�'*{C\W_�E��.X�3d���0K��Vg������J�d�� }�X������ӑ`��j��
�����z�3�'�ik��'��ڒPP�ī5��ݵS�U�Rܞ�V4H5���j��33i��4�Ci�7<�j��_U�j�W������*aeS���#�@.4� >;'߿	Z�!-� !9�h��P!�Pi! i`�f)�`�d�L�FK-��[�ٕ�ڙJ���"�n����.�����=���Fd�&�h����V��Ҙ���/:
T�zT1��ߩ���0�2��/�}X���Y#,�n�Hvk°F�d��f`�� ��L�u��V����O �Q��H@d��]|A�BI0��R4��U%�'��:r��8HM���i*���W(+��/xO\��Ъ�2��J.|� 	O���:���0�Nf}E(~�䡎x<��[��������c"�����X�|]�����S��>j:� �� �~1�瘂���H/�p��3<��:$�Bj�X�x��NJ/����ϑ�����^�����s���yOB��o�{�TmY�h%��BjL�؜z_�>wǵ{Y��k2���FӤ�.� 埳)�R����.I�B:�<9����t��l��-nS��~��J�0��F��3eLs\�ѠK����}}����F��f(��6�jbQ��A�}8�(fa00�))#�x8 e�o
�s"W���~`��R?^�Z��N�%�[@���A�J��G�DiC���(�>~�>1��Hc^�54J�j/��$X�HmI��Ǉ�CR/�݋�> ��}
���La�XC1k��b�4�L���l�I�?��#~����}Eèud����\�v��� ��]�U8�� \���W�$2G����}/��h!Q�0_����3�{�� ����ր���۽zO� ��5T7y��bP;)�V�K�}R����Q�H���=���_X0��66'.����D����4�Y9M�+�Xn=I
�1��K�Om��s��2rr��(}ny��ؕs^���C����)Jf��z+mr[���5!��>E�)��j"��G x��d��j��Hɦ�|�>��7���=�^{E�N��Ɏ:X�Cf�$ ��`��k��R���YۘEִ���U���nH�U���x}#%����7��y������}�h:��Hj^1�8�Z�u(�Q��WFʊX�:lol��,�dr�
��[�J*�f�U'c	�ل˛�Ou��B��B�^��my�Eu��gF��ȟK��T�j�ʘ��dYy�v�Tiw?���t�v�{� ���}�L�D����?R5�{ ��m�0D�6�u�D���8dUʳJ5��H��l�VKa{d5��fBC�?T/���A���)��B�Ahƌ��X8KO:|%mD[|��ES8F���VfuȈ���K7���Q��*��TaK�⋗�*�RNz��P��&��u�ޟ�)�Ԉ,��P��4}��*��G�͔ݩd\��3jY!���.�3�[�I��V��S��aQ�d"��\�����x�i�F�	?�F�AC��5V���!���8[��������mC�����:dv��~ۍ�5���hӢb=�S��!Q�4Z��C�%.3 k��'.���
ԋ=���"��1�4Ő���䉺6��;Z���]l����y��9v �zփ6�"����T��*���ɘ�O�x���$+J3���o/.*��� �Y�>����;t����(�V��f�/N�'��'}�����i�H���گ�_k��塶�Fqg��-�D�|�!���˕xA�	br�s�\��#269�NV!+>��?�s	��0=�O)w�Q�R,���F"-7Bd��Z�����m�2I��
���X�ׂȓ �0����?J�:D�v��_�7>�q�<W�@�X
_h�m���KE��mα3��O@��W��gGl7n��2�R��\�s%��ս��[�pdf&YP�y�V�=wv�����i����- PAw[*Rhe|��:�wC������on��� �:��Pt�n��M>�3]Pq�ؗ*yԠ-N�B2�T��r�\��ZV�GVR,ʔձ�&x�J7_�"X��ږ=��qRj�_B����ڋl����}�ƾ�Я�2�~�3�r�40q��N���ˉ׎TY5wޥ����lo	�^�<�D�:a���v)j��7�B�6��:u� v��Ҫh-�^��s�)���m2��Y�샞$	�#�j|2��43!���T��2��{�߅�6	R�}B��߻�#ǽ��AP/C��
�ڼnt�|�70�t���^K0����_� h��fU��0��;̇��nܛ02�i���h�V�7*�c����
��)�Cl�QqE�`}ȩ�Ǝ�r��c���}�$d3%Ӵ#��s�c�e�����WW��m��TN`ik>���U7�0[��.���'*����P��Y��M�f
a�Y94ɰ;��ُ��o�eSC����q�� �C5'�_�O���ܩ)��5�����	,��Q#�%� �IWАL�Y�T�J�^�S[��j��qa�����g��5S;�Yl�mf���te�v�f��R�i�m�yL2㽿�K�˴d�x�$�V��m�>�G�w|�tR�]@{��k��1d�{��嫼�;��;4�˳�7��A84�JhN*�i���Wֲ[S؏Jp��{ݗ��H�g|Q�#0�G��E#˶�����L��|�D�z�N~>�N�������vٹ	�,:�4(�<+RM篁�`B=T�4�FW����RO~���/�������`;�����ۍ?q��{��Đ�?H�zq�_�3;��ծ�fUK|r���g޽�2��MN.���=ʶ��v�븤>��5��Z�Ov�k��:uK�V+�m���G. YUg��o��w�����v����ڈ;@��t;�4�`��Uoҡ8׌ĵ�F���W�ٮ�~52��HS��y)(o���Bܤ{�.Y�6��!kZ9	�٧����)<
�0;��G�^�x�i���z�>yH��������C�7�O�kx81[y�ZE"���=y�1?WAL�\%x
��� <e��aGt�{(�lwS�*��è7e�/V�/�_+���E�����t��+���z��	��{F�=��|��d�y�B�H�/���I���«�۸}����8�^6{���X,^��d��H�6��h�{����v����yy�kc#��Zw��N�#
Y��7J������m�j����a��ه���ߟ�|�p�ڒ��ѬͿE�WY5(8�HV�^b;��f������,�AT�^��43�\�����o�=l}Fo�*�iBWR�x^$��u��i�[;�S���{��x,U����^��U�nI�a�P��i�Ӧ4��C��C�m�T���FX��~z�3��%Cl�X!��BT�B��B�Pa���[�Å��6��l��rs�6 G�8ػHx�����������u��`>?���Ƿ��V�;��������e�q�:�IܫG�j�8���Aס�,�$��_���ƺ���[�������"j��x���w8�צ��uktoF��������������q��"�ڰ$$���*�l)�7�1���#��kY+��rd6i��솑���ƶOgS��D
wŰ��K���h�z�*����h��o?4ټF������ŷ�����L����
;���j����#Q�&��mF?Z� �+��h�$�D��[)�_N\���<�����
h�w�gS�|.��sLTy@**	����HΒ#<y6�6|&��u4�9�����HΊx��r�3�Ac���h��M����Յ�H`p`#�|MQ�4�V�;���L�i�C��Y��'��=_�
�F.��L>u���@{�^X�]���r�B�б�W�|��/� 	/8�g&�`��*Zt�k�؄�r�1\��t����h-/ǽxt�ޝD��(��{�7�^R��@ (�:�o�b~͙�Y5�(/,��A��)�Ob���9�PD><�h=��l@��l
�e	����K5�J���sv�ڋF�ӀZ{6��΋��2~�8T1��<*�y��$�h����Y@�(��mF����z�G�]��K�H�A����R����
m�?#��$�q�YЋ<ikzH����]�v2\+�c[������2�S^p��[,�C'uJ�r��\��L.hfzloG�*X�LJ-C(� �2�b��[2�E�E�E��q�I�V�+�a@X��u7���+�v�����)c"�f�*>����C�6c%
���M���P����g�C�G��'
!�s�j,ce:�K�%y)V�Hud!��]U���ۦC`-��;�M@.$��U�.��Á���a}zcn5J�D*��w[I_@,m
nMLҨf��TKD�3��k�uC͈c�-�[����'Ϲ���aT���@��%�����t�؛%
��LwF��f7��EJU�m�I�V��k\�s;�a͞3��"%��׍�┍��y��vS,�fSC�Y[\	&q��/j��I63 /ݽSV����:r;Xy�H�\=
?uo*������f|�S�;Ub��hc
߂����}�"��:9L�DƜ$��}�`r;�^U�o�έ���5�y���X���0���|���i��"#��V�TN�J8[7�'��ǋ���f�i��1b�S������ѨV��'�ld���i.g^i��1������aM�Bq�d@���?��اj��\�Yѥc�����7��ǪPfP�]���*;f<X�[�J^�T�g.�N�VE�2��`���0���u�4, ��Y�?%����K���_�I����)�N������s�Q;�C�ѿeP'����V ?�Dͧ���Y�$��{��Y�ze΄���܎�Vp��z+:�E��nN3e�.�j\�k�Y�"9N�8p�^i����A���/��q^���]]�6f���v-�x-�G�6�HX�����ZIw��>!�#��誶�p�Qۦ:���F(��	�<Z3���=��k�5�x�BGy��4Y	���#d��G��b6Ya�w@���k����`�1��~�],�k����! ��z�bj��Z=�J[�<w����������j E�皼�6Æ<^�aPt��uҷ��X��c��ZM>�8�V��(n�t3��x�5�}�� � �W�75�/!Ȅ�� ��=��=,I%�}A�&܈Ze�|��m� M$��6�9V��߅i�1=���㿚�x�}2��l��,�Ą�"N�4�@7a��F�ؖ�W'�RA�'��C��**T�`o �����moAZ�dк�6�A/�8C�q|��Z_̛|�J�Kc����Mfo�-v�
�=&j0&{H���+1����kMi����A�|(�O䀲)8�����ޮ{^7f����Հ?^���ltD#|��ނ*T����lg<�0̎ L9����r#��� ��e�rg�++\*�Ae}���&|g�������ީ��`|*���"V��d��Հ�)�L��]��=��ˇ�,��c,�ս?1a���D��q�
FbVIgLew���#r�o�w�"G	b��"��
�d��_tY"3�K�,�� �K����f�ieAk}\���`�W�MO+X�Ej��]w�Z�L�u���Q��������([�MlQ�.�V��G*���M6����q
���]oζ
S$�/K��g��7�%b����L�'@:w.��pԡ���������z�1�'?�#��F������h����.#@�DkӀ��@�c�ߍ�<��^�x��"����L, �(kV*E��&�#�U�+�����U������[�h�őz C��~)O���� =�����!i��cs �U�%��t����4G�g]�_:��%�ܷ��]�������0�FXw9=�,u�4�v���\Vm�k�������`;�;"��I�c ��n�i�'� -oXa�%�u?\�v�^�`��G!�I��J��]����_	(<`S%�i
�T���`0��u����,���F���5�u���D��a�x����V9mNY��Wȅ7Z{�zQ�؄`Ɗ�8�P�|a�9���G>`�����%��R���.��U�/H�X
����'��g���Q�����0�
�+�UP��7_ɦ��m{��ɶ|������#ul�JK�=�#�Ęp���Ժ54'8a!���b���p�Pŵ���ɱ�������d�C9���}�#���}���w�yAZ|u&M��V!��
yG|�OJ��i�?�o~^�Qيd\I`< �
v]�[x6W��p���,��N�^��[q	�[!vۤ޴'�ݥ�zpn��mMQ:���a�;�r;#?`���{�}$\��2�t��DW�"�N�Z#��+lޅQ�T�>��{t�Yӯ�
E>���E4� 7)[�����l�7���7�*ǲZ�-,��&���ug+���@W/�j!����La��1A;�3Y�$h�&5��0�\m6WPh_�o�N_p�j��8�F�1�e:{'Bf e�ҳz�ǥ�9~�­�[������H�5���r;�w2�YV��\�Ql�S���c�?f"�F��?A��{wFd�Q��M_��:���\��(�����q.�����7�)B�4�e%�G���D.S�/E��Q�n��DZ�_N�̥P�:���u�u�r�?!��}����]ܗ�Lt٩]�?���R����_��:�nHQ���aj[��s�%X�+[Z��0�Tt��Й�������?��졘g��$\�y������⍧���l��J=��~8$>��@��`/���2*��;jg@��tQxp����|��� 0���_2���&�?	u��>����}�;�*�h2(�A�
�E7QR}{ .��Ga�� �����{C4r-���:�Q)o�#��w��U�j��$�Q��~M���蕒8Lߺ�%�Ш\ x�NS8?҈
�T4��Z|��p�-����M��SK��f�#]+��r�\���i�*�c�6Q�+��&�٩%OY��Am�[Vu���j4N�k���.�5����0��z3�pN(�������\x�~g$�h���c�X��WZ�}�X��K�V�g�Zy���$�^��p�O��AY^Wp�ז&�l���9Y�Y��-�4��VlP��;�V��H�)g�е-���$+��v��O��Y>
�N`����;�Xi�ْ�����%�v���ݮkL$��K\rj����M��VT0��0/E�&��h�vS��G*j���������{o*��aI@�if��q�O��#[S��&�L��7g�N{�j�a��_�Tcf��~��J�	G�8H��m��Vk}��ҷ�z�qt5��F�A*G�=�~�]Z��D��?F�},����� �!^�e#��q�T�JB�~M���������H�����+�Z�N��}�y;�OW��n�;H�@��f�`)�lJ{'��ȍ4�ۍ 0��᰼CP���C�̴9�4�T�(N��K�t���h�.忘��T�v��گ���L8#���8Ȍ�T�iH#$`�ffn�%�(62���x���7a�m
_��@�Qʎ��]i\�\|^by���>[E�D��:_����#��G�nC�HZN,�ї���p�KݛYn�����In�+�l��Tk�HWaY��n]������-mM��>4�@����z�n�n����kם>ܮ��ɴS�(���K�jQ�ʔ!х�K��oEsj=����MdS
�qFؘ�M�	�������ߏ �+��,�]�v�`�7�.��j���HL�DK�	�����
�O�����L��	��K��P���~�����l���e�+�����|=�0�2��Q�**-;4�������|��JB2|��W�����
��_�Z@Re�����͘b��7qg*k�)�8a�er<��M�i9c�M��c��$�Y�G7�)K|�R.M��HH��)Ʃ��=9i���X˂���'Ξk)���PX�]�	axũ7������4t���Ͽ�]�\���+��/��=�3ſ]s�����S��s!{\�_�u�2	6lp�� /�Tǰ.�;�G���.6��S::6���Lp1��#����!��c�W�Y1��gJ�W��,>*����ۄ-Vi�������@LvS����O��BQar&C�%�<���'8@�9�b-�{�.X�,fU�)V��,��|���~��q�ݧV��.�VQ���-Q�tlZQsA��V[�*��4��=�d�_�8Tk�TI�����O��IN��+�� � �x� �U�jP�T����aYUt�����v��u@��3r�ؠA;�c���<�ib>��aiHyF8F�� �*�8l�I*gw�1���mǱ��$�(u'�P�]�E|�KB5�\���EdN4�?�;ٖ�u�Pp�Z�w���C���%�x�1��Y�Ã���fb�=b���I⾄��GS��.z<�g6>�ς[T���a%[��CqD��M����3^Q�[ޢ���.5�>S��<+��d�B���p|�J9�Β
ow�9�IL�݄_��kT����v�
X�J)=�pfUo|�xgEV�[��(�=��9�F\^w�#j�S\���Tg�����'O~�,�LO�Y�Bl2
7eFٛU0�.1a����:��D]�?�[�pZ�c@}l�oE5�9��M� ��'�2�����_
	�L�8������=��qp9����m ���2�P���D��Ӿ��$Yt�����]%���Q�����9���!Xu4 "�ŀ�����I�ߔ\t��<�;�.���0��+ω�h����w��#���u�Sv��͡3gz(��2}K��"M�G�c�_ui�O@A'�ڍ���sl����j˨�yW�Q��|lv�����^��i�S��҃�!���vB�zI��f:]��ЫN]d�b�x����P�5j!�@3Z��ز�K�^���T\�O��[���?�#:4c�6������̏��ɟO�����W��@׻@.ȣV����"�c����I87ȋ����][������r&w#ں�}܇~��ׁ�:N�(��X,��J�t�]��Ut��=Y���倄
�s����o�0
�9s����e�J�qm��]#i�x�&)�o����L=��Ճy[�&�H��������^�O��T�������A9 I���5���=5��k�ì�O�Z�F�L{;p��̴ܰf���S�YX2%id۞B�οǼ0�q��F݇RD�*I�10�P�{�H����"[-^�MHI���}��>����0��(���1\x^�Yp:#�)�Έ�R>���3�������o.S5ˬ߆�_��̩W/����o�׈'�{j
��u�g�IE.#[�@��%LU��61`k������ݑ�A;J⪩���0M�'Xa�&uاy�����s�����=Y�x)��=��

n'A��+��C�4[Y��TF+�,�y)椰E�g/���kZ+�Aiiu�m��;h��9�R��>�۔�a@,�C�h��{�� ၌�7\-�bGXy
�e~���.���$����!�W	[iH6�q�6]�z���q��ꈯ�ǋK�C���������+Xe3����w�W������)Jƽ�ki�
����2�b��bkc��(��{q`#GB���[����	��,��9�.[� �|��zkNΞҩ�$`K�>��p!�C�:yL2�a��&��a��e�Z���/ř�����e@M��@�r}� ��}��w6)��/�=�T�I :	Ͷ�
�ЃYʾ�߽o3>ȏ��%Q�N�_��Y��Inh8��:�e%�+�a�~,���p-9��O�'�3��E\)���X|⴩�	�/͕�7Z2]��+X4.�<\}1j�,��~����<�+��cX}r�ک}�x�ygX�hAL�����zE��o47C��JG��W;=θ�׾X��;s,�2��}�vC\|xH�R�g���)��6��7�$_�iKZ��y��ar��k��c��GR��mҋE��E@&����k�j**e��8DT�ܴ���7�����hq*�W83�r��;6�=~�Ŧ7r���i��ϖ�#�c9,d�|�7:�$�b�����h�goyM������kބ�*8�3������hȱ��r�K�]#�9�o�|���xȵd��u��/^�P�t��'�Z�K9���	��'Q0����,L"�T
�٨��3]�הM)n��¸�}���]>�!�X�r����v�9���]�h��!���3��[cAq�3�7E��xN�y�˄���B��}_z[Ǜ`u:d����e̚fcgӣ�� Q�Ov�_�����s]Ķ/�Qas��Ow !
Rr�ggd&QYY�=�������)m�Mt����۬0��D��Fd#�P�TdЊ6��mu�rS�ӈ�X�(	�Q�>��N���+"�6t���⃮Ɂ9�>At�����i�/k�S�8&���m��\~
W��k[͢ �Wr7����R+��7��xӘ���o��*��;4Z��&��g�E�.���CFbD������
��c@��R��v@|��Qd�>9A �v8̐�����}�z��{k.�h�	�x���s��N"/���p�wK9�>���2cÎu2�F�Q���>��^� `WƂvw|L��a-������,^Ϗ��!���'v�}��y�huDl���sg��ն���`��X5*�.4�~1�GXq���C�@Tt���q��Q�7Q�@S4D.>xg:Z@���-C�Ò&�iܺt�rv+Cj~
��l��<{�n�a���������M8�C�/3�G�
nP�b�~���X�顔�M�\_� A�Gh[z�b�K�����8Nz~:�n��Aҳ�K��7����cT��Y�}/�Ǹ!�}2�,6N�\4j�.��3��.��MY����R��́�`�j=�K�W榍�Ps,�:�7 ay�b���4�N��: �e��y���dN*a��G��Lh^pKB����P+���[��#�b���t�bʬ$��b
[�W�w���� ��O��m~p���j�+7,��;܏]�f��v9��@�[4�CT_�$��[ɳ.�lLy(B���+e材�PFV1wc.H�a���va�8��8�p����T#��	�Q_���R1�!EB��@'{��q�Sm �ie�!n�	�K��Su��0G���@^�ʠǱ�� ��:Qt�!�Vu��m���s����o����?GM}�H"� ?�R*�,�
�f�#F2A`�Ӏ��'��mM,y�5�C��R��2an�z���A�/>��t��̟��q��h��z�r;���%�
r�yBPKυ9����}���#,0.�e��������n��P����vg\���.V2-25��ơ�ĉW,n�H���Y)&dŁ����G`v�ν�	*%)T��Gd������^:�`6N#���V�\��Φ�Ise�t�����ݗ��Kh����% D���w�F��O��峨y��fl��J�יִ��Y�񡙷/9�2hƬ%_ �����[&���A��H���$P�ጘ�^F�7����vj86�s��幉���Dh����L�\�0N8�9�!�RX� ��QO���![�L�\�'8�zz4���g��%�ϐy��\�;��s����f�y,Sm3ں������Es �<(������!�,��d�zj��q0���*(�6�GmБcz�J�?gh��Yk��zn@�B�K��*hh�٥{���+hߋ��ǝh��,ԑ/�w�I�fٰ#����V}	��Ѝ�޿�h-���Q[���c�c*�u���F�K}df��k��Q߳�7Y�]x� �e�H�[��.���x*f�V]�7�8�W�ܝ����M�7��i�������`�!�OJ�n?4َ�aL��E�E�62��IMR�-vn���V�&����l���M���U�.�B��[x���[$��y�\K���H���ؚq1��&�,U#@"��j6|�)�t/[;�%,�)6�w�V�a����j�ܲ5 Ii���T��uM�t�:%����{��k���Wܵ�|'��7	����Dv�pQ�;[�d���m�]Xلo�O�ښ�:U��S{��%H=�X���q�>eJ�^I/�2�_u�P���v���XL����U�Ϭ�Bz�UMp�Z������|�6����y�J��nӘm�:�E��~�c�/Cg��)�Ӱ�,y����T�������0.m�����g|�M[��<ܰMw��x����kN����~��[B���� �Ƽh���b�k 3�����>$Y�3�!��j�2����:N�4y�dЁn�z��#i���׀��Aʟ"fV}<�ؘ��K"��A+P?��6W�n9v x�������nc!'���O�v/�����9K���p3��e�T�%�0�(M|�$Kh�y@�ͳ���w-NL����v�'MK(��U��Ԫ���W���I-���4�P`��>�[}�����\�`ʚSt|R�� ���e�r�8czZ#W3��Y)����}ѱ�1���]I���0޼D�A�'��ñ�v�^cE�O�@��`z$@B� �9>�`BtU�H���J=�
�e��I�Ee��E���W�e���y>�(��!o�"rd�}��~�8���&��4���/����(�cR p+m��^b(���r�P�"�h}=�-)�E�[�7��;�3�ͦ����"	6�	��k�4!O��D��
h$���D�ܜ�y�w�'4Cm��CXN��9�!+��2�M��@n�����������?6TH�fP_�o�>���M��,��[C�L2�ځ����ա���G��s�!���^�0z�2��0�
�i�@G�Ga�f-!r��p�2g{6�P�����8�6\=?r4O�mΚJS%_�az��y4 �
"�@���TxKN�K��,+����x"醥�	���}����[�6T<'�0�qB/?<;Fv�A�$��u�Q?�h*v�U��OT9�m�نm	W&�ͧO)��z�a��s��.�~O��)z,@t1�v4�k�ѵ�|���>�����y�P��Wg�-�Xց���,Z� �$r�W|�zʭ�!˓2G;W��������F���#�W����7N��!#r��R��lT��ٹh���J�^-z^cCI �(�ul�����wewI����{�E���I�Үy>�nE_��`�k�K	�lԏs�����^^�-�ƙ���[&�2O��sl5�Kp�ͨ�ƨpBy7���f���T���#����c�� �b�8�h4'Ȃ1�<�;O�����Ð�l�zs�1�J�	���72��8���GJȄ��"K邩X��ȇ��4Z�V-�4H"�C���o,C,��?nK��ꓕPp`�?�Gb	�D3tX�E!"�I�yFz�'���Iqy��o�\f�)d,*g��W�Ŭ�b��lX��r�9Eہ �G���M��z*��o@ΎJV��\_�]��+'0�J�%�.#uUOڂ��ٛ��M�+,��e�nB�O:��{M��G�Y�tlLW��ےfe�67�!�W��.~���2)��.z��C�.C�+�lC99��D�h\�t(;�����x���{DQ�HlÈw�2d5���S�b�g�R�eQ(�<uP�*�T} #]�)���OE�딅Ǽs���k�s�j����ْ�� �?'�q:oI��7����"Q�<}����+6Z��+���߳��Ryh�g[�C��Z05P^�ɣQrH������TM������J��t�W1�%����t>�6���p�[4��mhS,O1�����HTf�`x���@~��fXD]z� B/�Z���k�A>h[E�S�=U�?������p�僰/���0�6�a�yО��m�$��9��
 Z���q�s~���E��Ey���ap@ �qf��eY�IR��
�/���G� y��$�Y	����Y�0��ï���v�or�lR�1Ur܊�
?WH�2�4�,wL�U�L��tiL�Df�T����]�����8&�ƀCXi�߷	��߅����;{�
x��"/��,l�A%1�Yc�~X���w����R�0�נ���Ob�m�g>�@�O9�r�vB�7�4��aٝ�D.�;�ߎ���R�5�t~���G:��#X��3�\	#�
r!V �+�X�g'��J4�>y3XT�,\��mo �c�C��9�)��W$vߌt�ʈ( ��v��f�����荃0;���+����}<k"|+,��ஒ�R��4C5H���e-����f,�gT.IM�+������d?�`�sQ�)U����~05�'�=]���o�2�G��W�X�>�r?bK�+uC�^@�lo�5$�X=�E_K��2
]������͂�jb��߃�.��֯,{�7tX�Q�)������f�e�A���Tj�7lA��1� �3�>�yx�LJ��dh�R����lJIr�)���B�\O�Mǅ�DT�k9�SF�2�趢�|��+C �e�tq��4�vr�+�?i^�k�=��f�L�FF�9,�߽i� T����C�O��_��<:IE.Q	}��4��J����.�l�|U߫����\`�J����XGy}y)�Z��/��������ʐEld�V��\J�V<��o�8=>&q�A�=Ň�B��S,�<1��W��K�E��z6)��,����:*J�B��{��h���>ힷ	�܍��>a�;g� ���lUC+k^���HpV��D���gR�q
ߑ����Z�fM3Dð�Cvv��s�
����-����}̰�q�'��3�!I���{��J�S�n�V��J�
�:�ʬ��?0���Wc#��"8�̦wShvW��0�NI�]�cU�������"~�d`�dʽ"s�pw���ǅ��w��}$;��W��KY� 5�Λq���ɡ:��bL�A2�]I�O��7�<�Φҏ@�������ꍰ�ŀ��;OȤ��,���Ç�w��./-d�~��בΜ��M���M�|wݑ�%�M�ޫ�'�7P�`Ğ�7N7�:��%�πm)��� e��]d�%��W�zZ+�E�Ή��=/���\���}Pߜ����N����x�^;�ڛحѝ"�L(�M����q�ȅ���.�C���3�Xy򢤼D�{ Ջ�9<<=�m�� 4o�p4}���.L�D�B��q�RI7���^�'��o��{SZ����n��I�p���6t1$��.�]�4G�l-cG�D�T��3�ts#���\=�I�ς�[����`�QڦD�m���XJe�kS�K��g���j����`n�h�{pں�����p�_�a�4M�*r�~s� 	��
D���1$^�.�^��8��ˉы��$&X�F��l^�^�>ئa�㱋�mJ�f��dh��	��cU=���x�4�!o:HnPD"�e�w�@ꖽ�J���o���3�
�f�"ہ�E�	�Z�4*���M4��V����u���{Uh�� ��7�����m��x�Q����:�q
�4�7��
[Ҭנ�~�����n�c���r��rq�#�tX���3iqNky�գ��+��3 ��]��Wi��={P������,�/���RQѶN��A\� ���X}�ΛYAZ�����{U_;�����y)M��zWx4nD�u�Z%�	��6�6)��
N�Cв�`��ܨG%�4��5�8�}D���W+���\��e����[���))n��H���+X����"lӁz�c����NU ;����"7��̎s��̙P����y+��r�}�V�ƃ7{�k���Z�:��Ő,΃�81`%�nư@�L.l����E�I�v�6|O� �V�����KgQ3Cև�W6�ݫ��T,��ag�S>o�ya���)d������f��ej�T�r*�g���e�/��!R&���Za�:7E]D���Ahd�zȻ�L��iݥoCB����?��LEz9wq�tNN�1��m��;SA���a8ݤ�^i���y-�Թ!���=eRs�N}vtK�ZN��8�o7�J:���|�qkL���a`~ q�D��y?a�7�p�L:�x�K�Bj���ͨv� 5�w}��hG�E��F�^8&f斁�Z�12�̡���e��Vֲf�6�s�\8X��`%
�X�VH���>�!�@C���
VQ�}��O���8?�1LI��Ό��ja5�O�f�ۊE��6RS��'$�}fn��`k
Q���4-.H_lU�����:If*b���"�U�J�o!��b��r�vЦ�˭9O�L�i�!U��E�����O%k'3�_L���}d��m�(N3���K>���6����z�����F.@���M��3أ��2�n����c;�#��΢�D"�L�&r���gFW��)��t�Яy������۷+v!+/2�����"iG�o�i�ї��2�xq���|w��z�`P�c\&6` �g'��~��Oop#2�a�;Be_�jʿ���H��m��:8�4s�l��;�~�ȼ��Ű�]+>}(0Xk�U5���曔}�(f\�/f��P�,���:p&I�B�2;��Fr�f�Pԗ�x{	�AYKU�-3��L�֩tL�����ߑ����?���{�/M��g_�[��2]��뱢o�?��d�Zz7��Q�n�(������&s�[���h�������'l�쮓������7N��E>LL�V"&Q��Y\+���_'V�Z9���*Pʗ$ɭ��c $r[�w6u�~l��M�f���`ؿpՕ��&P#�����!�g�8��n�8�q\b���bM>��M���C���S�ݥ�ϟ|t�,�n��x{\\��9/�E��7�C;)�n�H���񒼥�~=��D�l`T�ļ��K
�Q�,�5=�T�,�Z?|M��w;tz�$�%�YE?����tBe�ThYM����|��W�t���W�v�ޮ��ս��5�!�v̒>�K�1�l�ϔ�/�=�a�?�>��<Z�V��ow�[�U�r3���>�V�R]n�}ݙ���2"X<�V��,�a�L�� �ȱ �%�_aE����DI���۰��q�6��*�|.�[a���Ň�$���Ķ��|R4�tZB��r&t��֩�%9���>��R}�D0y6���ok<��7>[Ը��f�#����e��Ʈ�4���'��r�8@=�*����m?|���ָ�?�*ܑU^S<e�{�V����P,R�q
��lh���%3c;���[�M�_���8G���?�/�Ȧa��
y�a��(҄�`��
+O�8̾�������0��>����2�u;M����uU��L���KR>�m�ܧ��L&Z�x,R�Bgrl��tΒ��B�7ܛ�u�8�
 �]\=7���ͻm<)�JP�H�^p{O���,uM���ف�A������ϸ>��x��P
� =�]��桞g	v�z|� �q�s�FڂlK��=�Sa���C8)tD�^��B���y?������iJ�2��eðLq9�hc,]B�c�;(<�����^m���c�7�]��;������\6�2>M�qr1�fU��ſz�w��@.�(����`����M\`[>i���/���f����b�/�� ($��C���i:iܣc-�+�X�^H}��|�J��X}�SO��M&H��O��� ��
(����4�����h����Vxׁt��+����{Yݹu��`���Z[�:6[s��7�(>o� \��H��!F��)Ç|q}�=�[rn��-�=�<�UD/��[E,R���Z���R�Ir��{��p��\|T��݅�"���T���o~��w��Cn��$����'=�ب̀��[���a�T�Da�j�tP�Z���o͝�4��
U3���߯���?i�[$7�ۗC��4/?�Omo?� ��Gw}���KP�I*�U<�[n/��>D�[L�Z���v1� �	+�u��w6F��I������c:�_4?��d�ύ.=�wJ���ls{�ڇ�.ʆq�����)�`m��i�DP�.�����oM�x�8����E_��G����L������n����6�� ���%�x,|��MxO�I�x�k��^�R���Ig�f.����/ז`2ӛ"0���)K��Ѧ�w\�i�J�IZ_��!�����h��V4ފ�5q#��9n����	�;7>�͜1����J���v�3f�ߖ��v1r��/G!�,"ɤ�P�+#U�h@�u`�d΄����d��.㙬����۵t^���`��^A�u�ָ�j�E.�o��m>b=�3 9t2������W��?����;}�'���O$t~�_A��g��������ˑ.�6����ll��b�t���_OMA���ZzL䀅P�Պ_F��� eX��TKR�J�l�<��<%D+8���cL�'B���dN��s~J�1�/�Sk M�E�� O�s����4Z$�.u��"
�W{� 2gݎU�:20�P�l�;�P*�Lt�/��0'���d(=R(_9J��Kr`B� d&�\ͭ~z=Β{��=a�zvw���^��P�nl'L���(D��ZI�Ig��	ro���7��oʯ�Q�T���'R�Ր����� ����8(.�5��ٳ��r�H�_|����ߥ�T��E\�(�Iu7���I��>{���t���H?lB�v>�ڥt���m�r������24;���x9������akA�nG�0F=��Ƿ��Rw\�@4h�G����y���N��ߛ)�Bo\�ͨ��jx�zM���L4��V�A��%���%�	{2[ �eS�ɔ��Wq����������7�x�n}���и���pV�8�(
#*��Hσ.�wl�S��E%F7�9�N�`%3�{���}dwX�="&_�V���Y��Mlb E�7����M�[H�Ji�v�n'MvJXJ]���[S�cT��L9��\t[��ƽ!���HzA�D��"62r��c��~h���O��
�&���k���ڗQ�m+ ܂b����e��<Xpųkk�6�Q�/;~n:d��,m[�<����y��%u��h�fM=V�7���Y_�Qi������ǌ� Y;?`���昤�[������J���Z��'�,����k�O��}2���i������Q�ǩ+ғ�İ?�Ҟ�u� _
�����C���j��ϐҒ�e1��h����I�"{���X�?J}��R[h����3l���o1rL�׶��x�~᠙�Y��ވ������A���I��y�����E�V��G��B����{続U:p�U��Eo����|�xK�^ѱ@zDx�EE)�_�k��cXV�zf�ܢg�{K<hG��l��(:;���lj������f�B�F������wͻD�bJ�z�] ��0�dϚ���
P��h��$R4��������V���� �քX���>��'��yw�#c��j\��
q3�~kz�mcJ]�WN�˓:$Z3�����	�ƫ��PU�6v+ڡ�ucǱ@:xZw=k[Y܌�h�T]~� �\EQ�MtF��yּ2M�`7�G�:��EY��
�r��	ݳr�_e�$�4�X(�A	o|.��	W�#p"��X#jk̙��� ɗ�������4nȲ��} %2�����C
�E-�SYy���(���9.J�U���u��b����5�5�PO��� �7�k�ж�U������ZV��ǜH��4Z�#r�����Wv/�uihFj�:l=	�Zʄ�OxM����g�fI�&po��U�i�"{���nf�ٷ�+	��/W1�87��a�5q���	��u��K[ �@�� ��J~����(-�^�S�|+�6R>�]v�"^Z���Go�f�M��;�#X�5�v/��7���������=㶟X���<�N/�J��Ś#�*���N~(|���ۓ�'�d�trӣ�`�jJTS�M����IQ��мTM��N��v�
�����o�`� Rʠ;���%�i���9������O��{Y�gjc�|��h)(����ˑ��k��ĩ�K��1���Ox�Ѭ�SEo�i�v�
�FLm�ݏ�ۚ�J@�.���yG���!�.*a�Kj��Y~1�<!oߧ?n(��Ғ���$� �����cچ'`+��$��z��8�A�LC�D����5�ėS�S4t� �h�����,���@?�i���@��}���_�2���1s-��YL��3��E��Ӥ@u~V��=|EC���9��YNW(��P�\*��,���
V�e�z�&�b��r���Lϧ6:@���e�D���xac��S{=	B�}|��}���o�E0P;��*w�L�@Պ��0fn�.
��W?d�+���'\q T`ٿ�&v��Q���r����Cr#��a»��t�:T���m��f� IBg-x���:�Tne��g.���@���F�}
z�j�tG��2*��C&�MBn�׸��<ġ]Y�B�C=Z�(`��v���pV\�Bkྱ�\�O�2.9��a�(_���%��r�CI#�Ϩ s�����I�d���?�/�9�fY��k-��U�N�A*<���n��fY����ڇ#���z�D��B���?�_�)�Ź�aZ�@-/�q��FE�K�X[D��#Ȇr�M3�6}u�k��G�z�쎾��̌e�?����)�I��������j��n��fO����%��6A*eh�� �#B��r��sҠI1$i��5%ԜM���ƶ��.�ZDkޚ1���1�
���R��0�d�6��fP^(Lr^&��i��b��NG$t#F�!�Q`� �ɏ	Α�O��Q�<Y�d�|&����w,Yv����	:�]n�܂�s)C�>Z~����)ZLk%;x�5��d�D`�BSzX�C�75�aBװ�5ni��nD�~:G:@cUF��<��&�d0�}����v�s@�c�V���~�x�?�<�nW;����`ޒ,��4���a�����>����N9�T��J�A    aNң�&�; ����:����g�    YZ