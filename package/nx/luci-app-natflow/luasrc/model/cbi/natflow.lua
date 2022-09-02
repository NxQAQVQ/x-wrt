
m = Map("natflow", translate("Advanced Options"))

s = m:section(TypedSection, "natflow")
s.addremove = false
s.anonymous = true

s:tab("system", translate("System Settings"))

e = s:taboption("system", Flag, "fullconenat", translate("Full Cone Nat"), translate("Generally do not need to be enabled unless used to play games."))
e.default = "0"
e.rmempty = false

e = s:taboption("system", Flag, "enabled", translate("Enable Fast Forwarding"))
e.default = "1"
e.rmempty = false

e = s:taboption("system", Flag, "hwnat", translate("Enable Fast Forwarding Hardware Offload"))
e.default = "1"
e.rmempty = false
e:depends("enabled","1")

return m
