# https://www.dell.com/support/kbdoc/en-dm/000136288/idrac-how-to-set-the-idrac-thermal-base-algorithm-via-cli

function set_dynamic {
  HEX=$(printf '0x%02x' $1)
  ipmitool -I lanplus -H $IDRAC_HOST -U $IDRAC_USER -P $IDRAC_PW raw 0x30 0x30 0x01 $HEX > /dev/null
}

set_dynamic 1
