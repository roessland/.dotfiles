# Report pack, maintenance and tag state. Usage: git-health [--delete-tags]
# --delete-tags saves the tag list in .git, then deletes all local tags.
git-health() {
	emulate -L zsh
	local delete_tags=false
	case "${1:-}" in
		--delete-tags) delete_tags=true ;;
		"") ;;
		*) echo "Usage: git-health [--delete-tags]" >&2; return 2 ;;
	esac

	local common_dir
	common_dir="$(git rev-parse --path-format=absolute --git-common-dir 2>/dev/null)" || {
		echo "Not a git repository." >&2
		return 1
	}

	local packs loose
	packs=$(print -l "$common_dir"/objects/pack/*.pack(N) | grep -c .)
	loose=$(git count-objects | awk '{print $1}')
	printf '%-8s %s\n' packs "$packs" loose "$loose"
	if (( packs > 50 )); then
		echo "         Many packs. Run 'git gc'. Do not use --prune=now when worktrees exist."
	fi

	if [[ "$(git config --get maintenance.auto)" == "false" ]]; then
		echo "WARNING  maintenance.auto=false: commands do not start automatic gc here."
		local top
		top="$(git rev-parse --show-toplevel 2>/dev/null)"
		if git config --global --get-all maintenance.repo 2>/dev/null | grep -Fxq "$top"; then
			echo "         The repo is registered for scheduled maintenance. Check that the scheduler runs."
		else
			echo "         No scheduled maintenance is registered, so packs are never merged."
			echo "         Fix: git config --unset maintenance.auto; git config --unset maintenance.strategy"
		fi
	fi

	local tags
	tags=$(git for-each-ref refs/tags --format=x | grep -c .)
	printf '%-8s %s\n' tags "$tags"
	printf '%-8s %s\n' tagOpt "$(git config --get remote.origin.tagOpt || echo default)"

	if [[ "$delete_tags" == true && "$tags" -gt 0 ]]; then
		local backup="$common_dir/tags-backup-$(date +%Y%m%d-%H%M%S).txt"
		git show-ref --tags > "$backup"
		git for-each-ref refs/tags --format='delete %(refname)' | git update-ref --stdin
		echo "         Deleted $tags tags. List saved to $backup"
	fi
}
