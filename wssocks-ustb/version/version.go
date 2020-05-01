package version

import (
	"flag"
	"fmt"
	"github.com/genshen/cmds"
	"github.com/genshen/wssocks/wss"
)

const VERSION = "0.5.1"

var versionCommand = &cmds.Command{
	Name:        "version",
	Summary:     "show version",
	Description: "print current version.",
	CustomFlags: false,
	HasOptions:  false,
}

func init() {
	versionCommand.Runner = &version{}
	fs := flag.NewFlagSet("version", flag.ContinueOnError)
	versionCommand.FlagSet = fs
	versionCommand.FlagSet.Usage = versionCommand.Usage // use default usage provided by cmds.Command.
	cmds.AllCommands = append(cmds.AllCommands, versionCommand)
}

type version struct{}

func (v *version) PreRun() error {
	return nil
}

func (v *version) Run() error {
	fmt.Printf("version\t %s.\n", VERSION)
	fmt.Printf("protocol version\t %d\n", wss.VersionCode)
	fmt.Printf("wssocks version(core version)\t %s\n", wss.CoreVersion)
	fmt.Println("This is a socks5 proxy which allows you to visit internal network in USTB.")
	fmt.Println("github https://github.com/genshen/wssocks-plugin-ustb")
	fmt.Println("based on https://github.com/genshen/wssocks")
	return nil
}
