from ranger.api.commands import Command
import os

# for code
class code(Command):
  """
  :code
  Opens current directory in VSCode
  """

  def execute(self):
    dirname = self.fm.thisdir.path
    codecmd = ["code-insiders", dirname]
    self.fm.execute_command(codecmd)

# for ranger
class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        if self.quantifier:
            # match only directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        else:
            # match files and directories
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        # dirname = self.fm.thisdir.path
        # command = f"ls {dirname} | ffz +m"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)
    # def execute(self):
    #     import subprocess
    #     command="rg --files-with-matches --no-messages self.arg(1) | fzf --exact --tac"
    #     fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
    #     stdout, stderr = fzf.communicate()
    #     if fzf.returncode == 0:
    #         fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
    #         if os.path.isdir(fzf_file):
    #             self.fm.cd(fzf_file)
    #         else:
    #             self.fm.select_file(fzf_file)
# fzf_locate
class fzf_locate(Command):
    """
    :fzf_locate

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        if self.quantifier:
            command="locate home media | fzf -e -i"
        else:
            command="locate home media | fzf -e -i"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)