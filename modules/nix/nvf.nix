{ pkgs, lib, ... }:



{
    environment.systemPackages = with pkgs;
    [

    ];

    programs.neovim.enable = true;

    programs.nvf =
    {
        enable = true;
        settings =
        {
            vim =
            {
                viAlias = true;
                vimAlias = true;

                theme =
                {
                    enable = true;
                    name = "tokyonight";
                    style = "moon";
                    transparent = true;
                };

                lsp =
                {
                    enable = true;
                };

                statusline.lualine =
                {
                    enable = true;
                    icons.enable = true;
                    theme = "tokyonight";
                };

                telescope.enable = true;
                autocomplete.nvim-cmp.enable = true;

                languages =
                {
                    enableLSP = true;
                    enableTreesitter = true;

                    nix.enable = true;
                    lua.enable = true;
                    rust.enable = true;
                    clang.enable = true;
                    markdown.enable = true;
                    sql.enable = true;
                };
            };


        };
    };
}
