#!/bin/bash
##################################################
# project sync shell
#
# Usage:
#   {this}.sh param1 param2
#     param1 - unused
#     param2 - unused
#       :
#
# Use file:
#   ./sync.ignore
#   ./sync.conf
#
# Descriotion:
#    sync script
#
# Author murayama
# Update 2013.03.26
##################################################
# read config file.
source ./sync.conf

# setting path check ============================
if [ -z "${FROM_PATH}" ]; then
    echo "error : no setting from path."
    exit 0
fi
if [ -z "${TO_PATH}" ]; then
    echo "error : no setting to path."
    exit 0
fi
# ===============================================

# ssh setting ===================================
if [ "${FROM_SSH_HOST}" -a "${TO_SSH_HOST}" ]; then
    echo "error : from path and to path settings."
    exit 0
fi
if [ "${FROM_SSH_HOST}" -o "${TO_SSH_HOST}" ]; then
    SSH_OPT='-e ssh '
    if [ "${FROM_SSH_HOST}" ]; then
        FROM_PATH=${FROM_SSH_HOST}:${FROM_PATH}
        if [ ${FROM_SSH_USER} ]; then
            FROM_PATH=${FROM_SSH_USER}@${FROM_PATH}
        fi
    fi
    if [ "${TO_SSH_HOST}" ]; then
        TO_PATH=${TO_SSH_HOST}:${TO_PATH}
        if [ "${TO_SSH_USER}" ]; then
            TO_PATH=${TO_SSH_USER}@${TO_PATH}
        fi
    fi
fi
# ===============================================
echo "from : "${FROM_PATH}
echo "to   : "${TO_PATH}

echo -n "sync path ok? [ok]:"
read CONFIRM

if [ "${CONFIRM}" != "ok" ]; then
    echo "no sync end."
    exit 0
fi

echo "sync check start."
# sync check start
rsync -arvn ${SSH_OPT}--update --delete --exclude-from=sync.ignore ${FROM_PATH} ${TO_PATH}
# sync check end

# input check start
echo ""
echo -n "sync start. [yes,Y]:"
read CONFIRM

if [ "${CONFIRM}" != "yes" -a "${CONFIRM}" != "Y" ]; then
    echo "no sync end."
    exit 0
fi
# input check end

# sync start
rsync -arv ${SSH_OPT}--update --delete --exclude-from=sync.ignore ${FROM_PATH} ${TO_PATH}
# sync end

echo ""
echo "sync finish."
exit 1
