# !/usr/bin/env ipy
# -*- coding: UTF-8 -*-

import os


class CmdFileCreator:
    def __init__(self, folder, filename):
        self.folder = folder
        self.filename = filename

    def create_file(self):
        filepath = os.path.join(self.folder, self.filename)
        with open(filepath, 'w') as f:
            f.write(self.cmd_text())

    def cmd_text(self):
        return """for /f "delims=" %%x in (config.txt) do (set "%%x")
                               set STANDALONE_PUB_HOME=%~dp0
                               set CMD_LINE_ARGS=%*
                               set TEMP_FOLDER=%TEMP%
                               cscript //E:jscript "%SERVER_PUB_HOME%publisher\\res\script\\test.js" ^
                                   -pubSource "%SERVER_PUB_HOME%pubSource_issue.xml" ^
                                   -temp "%STANDALONE_PUB_HOME%temp" ^
                                   -xmlPath "%STANDALONE_PUB_HOME%XML" ^
                                   -pmPreviousPath "%STANDALONE_PUB_HOME%pmPrevious" ^
                                   -resultPath "%STANDALONE_PUB_HOME%XMLDone" ^
                                   -log "%STANDALONE_PUB_HOME%log" ^
                                   -standalone ^
                                   -mode "singleDM"^
                                   %CMD_LINE_ARGS%"
                               """