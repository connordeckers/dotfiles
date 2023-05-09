
function rollback_update --description 'Rollback arch application installation to specified date'
	echo "Not yet implemented"
	# if [[ $1 == '' ]]; then
	# 	print 'Date must be supplied, relative or absolute accepted.'
	# 	return
	# fi
	#
	# # Get a unique ID to keep our good mirrorlist 
	# set timestamp $(date +%s)
	#
	# # Rename the mirrorlist with our timestamp
	# sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist."$timestamp"
	#
	# # Create a new mirrorlist file to tee into
	# sudo touch /etc/pacman.d/mirrorlist
	#
	# # Get a date object from the timestamp, as year month and day
	# year=$(date --date $1 "+%Y")
	# month=$(date --date $1 "+%m")
	# day=$(date --date $1 "+%d")
	#
	# # Tee the archive of the mirror into the mirrorlist file
	# echo "Server=https://archive.archlinux.org/repos/$year/$month/$day/\$repo/os/\$arch" | sudo tee /etc/pacman.d/mirrorlist
	#
	# # Force pacman to update the cache (yy forces it to refetch even if it considers itself up to date)
	# # and uu forces it to allow packages to downgrade
	# sudo pacman -Syyuu
	#
	# # Once the downgrade is done, revert our changes to the mirrorlist
	# sudo rm /etc/pacman.d/mirrorlist
	# sudo mv /etc/pacman.d/mirrorlist."$timestamp" /etc/pacman.d/mirrorlist
	# 
	# # Update the mirrorlist, but not the packages themselves
	# sudo pacman -Syy
end
