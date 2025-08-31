#!/bin/python
import numpy
import sys
import os

os.getcwd()

sys_dir = {
    "Desktop",
    "Documenti",
    "Immagini",
    "Scaricati",
    "Pubblici",
    "Musica",
    "Video",
    "Modelli"
        }

hiden_folder = []
hiden_file = []

generic_dir = []
generic_file = []

sys_folder = []

def bubble_sort_by_length(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n-i-1):
            if len(arr[j]) < len(arr[j+1]):
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr

class Search:
    def __init__(self):
        super().__init__()
        self.filtering()
        self.writing_empty_dir()
        self.writing_empty_file()
        self.printing_system_dir()
        self.printing_generic_folder()
        self.printing_generic_file()

    def filtering(self):        
        if len(sys.argv)>1:
            os.chdir(sys.argv[1])
        else:
            pass
        for dirs in os.listdir():
            if dirs[0] == ".":
                if os.path.isfile(dirs):
                    hiden_file.append(dirs)
                
                elif os.path.isdir(dirs):
                    hiden_folder.append(dirs)
                
            else:
                for element in sys_dir:
                    if dirs == element:
                        sys_folder.append(dirs)
                    else:
                        if os.path.isdir(dirs) and dirs not in generic_dir:
                            generic_dir.append(dirs)
                        elif os.path.isfile(dirs) and dirs not in generic_file:
                            generic_file.append(dirs)

    def writing_empty_dir(self):
        bubble_sort_by_length(hiden_folder)
        if len(hiden_folder)>0:
            print(f"\033[31m+-- hiden directory --")
            for ele in hiden_folder:
                print(f"| {ele}")
            print("\n\033[37m")

    def writing_empty_file(self):
        bubble_sort_by_length(hiden_file)
        if len(hiden_file)>0:
            if len(hiden_file)>0:
                print("\033[33m+-- hiden files --")
            else:
                print("\033[33m+-- hiden file --")
            for ele in hiden_file:
                print(f"| {ele}")
            print("\n\033[37m")
        else:
            print("")

    def printing_system_dir(self):
        bubble_sort_by_length(sys_folder)
        if len (sys_folder)>0:
            print("\033[36m+-- system directory --")
            for ele in sys_folder:
                print(f"| {ele}")
            print("\033[37m\n")
        else:
            print("")

    def printing_generic_folder(self):
        bubble_sort_by_length(generic_dir)
        if len(generic_dir)>0:
            if len(sys_folder)>0:
                print("\033[35m")
            else:
                print("\033[36m")
            print("+-- Generic directory --")
            for ele in generic_dir:
                print(f"| {ele}")
            print("\033[37m\n")
        else:
            print("")

        
    def printing_generic_file(self):
        bubble_sort_by_length(generic_file)
        if len(generic_file)>0:
            if len(generic_file)>0:
                print("\033[33m+-- Generic files --")
            else:
                print("\033[33m+-- Generic file --")
            for ele in generic_file:
                print(f"\033[33m| {ele}")
            print("\033[37m\n")
        else:
            print("")

Search()
