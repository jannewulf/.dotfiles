# https://gitlab.gnome.org/GNOME/nautilus-python/-/blob/master/examples/open-terminal.py

import os

try:
    from urllib import unquote
except ImportError:
    from urllib.parse import unquote

import gi
gi.require_version('GConf', '2.0')
from gi.repository import Nautilus, GObject, GConf


class OpenTerminalExtension(Nautilus.MenuProvider, GObject.GObject):
    def __init__(self):
        self.client = GConf.Client.get_default()
        
    def _open_terminal(self, file):
        filename = unquote(file.get_uri()[7:])
        os.chdir(filename)
        os.system('x-terminal-emulator')
        
    def menu_activate_cb(self, menu, file):
        self._open_terminal(file)
        
    def menu_background_activate_cb(self, menu, file): 
        self._open_terminal(file)
       
    def get_file_items(self, window, files):
        if len(files) != 1:
            return
        
        file = files[0]
        if not file.is_directory() or file.get_uri_scheme() != 'file':
            return
       
        item = Nautilus.MenuItem(name='NautilusPython::openterminal_file_item',
                                 label='Open Terminal' ,
                                 tip='Open Terminal in %s' % file.get_name())
        item.connect('activate', self.menu_activate_cb, file)
        return item,

    def get_background_items(self, window, file):
        item = Nautilus.MenuItem(name='NautilusPython::openterminal_file_item2',
                                 label='Open Terminal' ,
                                 tip='Open Terminal in %s' % file.get_name())
        item.connect('activate', self.menu_background_activate_cb, file)
        return item,

