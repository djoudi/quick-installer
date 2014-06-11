# We need curl for the next step
apt-get install curl -y

# Add repository for BitTorrent Sync Unoffical GUI
sh -c "$(curl -fsSL http://debian.yeasoft.net/add-btsync-repository.sh)"