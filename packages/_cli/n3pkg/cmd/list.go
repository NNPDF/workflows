/*
Copyright © 2022 NAME HERE <EMAIL ADDRESS>

*/
package cmd

import (
	"fmt"
	"reflect"
	"sort"

	"github.com/N3PDF/external/_cli/n3pkg/packages"
	"github.com/spf13/cobra"
)

// listCmd represents the list command
var listCmd = &cobra.Command{
	Use:   "list",
	Short: "List available packages",
	Long: `List all available packages: 

For this packages scripts are present (nothing else is guaranteed).`,
	Run: func(cmd *cobra.Command, args []string) {
		pkgs := make([]string, 0)
		for _, key := range reflect.ValueOf(packages.Scripts).MapKeys() {
			pkgs = append(pkgs, key.Interface().(string))
		}
		sort.Strings(pkgs)
		for _, pkg := range pkgs {
			fmt.Println(pkg)
		}
	},
}

func init() {
	rootCmd.AddCommand(listCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// listCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// listCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
