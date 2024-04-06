require("mdeval").setup({
	require_confirmation = false,
	eval_options = {
		cpp = {
			command = { "g++", "-std=c++17" },
			default_header = [[
    #include <bits/stdc++.h>
    using namespace std;
      ]],
		},
	},
})
