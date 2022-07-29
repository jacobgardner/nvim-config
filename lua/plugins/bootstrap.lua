return function(callback)
	local fn = vim.fn
	local packer_bootstrap = nil

	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		packer_bootstrap =
			fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	end

	require("packer").startup({
		function(use)
			-- We always want packer to manage itself
			use("wbthomason/packer.nvim")

			-- Our custom plugins
			callback(use)

			-- Put this at the end after all plugins
			if packer_bootstrap then
				require("packer").sync()
			end
		end,
		config = {
      ensure_dependencies = true,
      display = {
        open_fn = require('packer.util').float
      }
    },
	})
end
