module("luci.controller.natflow", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/natflow") then
		return
	end

	entry({"admin", "status", "natflow"}, cbi("natflow"), _("Advanced Options"), 99).dependent = true
end
