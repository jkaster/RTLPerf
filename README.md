# RTLPerf
This is a test project to show RTL (Run-Time Library) performance differences in Delphi versions

The current incarnation is intended to show the difference in TFields field name lookup in XE8 and 10 Seattle (DXS).

You can run the tests yourself, but here are some results from my test:

* XE8 100 fields 1000 times, Found: 1357 ticks Not found: 30565 ticks
* XE8 100 fields 1000 times, Found: 1351 ticks Not found: 31006 ticks
* XE8 100 fields 1000 times, Found: 1431 ticks Not found: 30353 ticks

* DXS 100 fields 1000 times, Found: 618 ticks Not found: 30195 ticks
* DXS 100 fields 1000 times, Found: 641 ticks Not found: 30816 ticks
* DXS 100 fields 1000 times, Found: 645 ticks Not found: 30594 ticks

As you can see, DXS is more than twice as fast at finding field names. It also doesn't incur any performance penalty when the field name is not found, being the same or slightly faster on the "not found" path, where it ends up doing an IndexOf() on the field list for both versions of the RTL.
