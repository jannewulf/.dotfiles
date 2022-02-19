# Startup Files
This file describes which files different shells source during startup.

## zsh
See: `man zsh` under [Compatibility and Startup/Shutdown Files](https://linux.die.net/man/1/zsh).

On system login: `$HOME/.profile`

<table>
  <tbody>
    <tr>
      <th></th>
      <th>login</th>
      <th>non-login</th>
    </tr>
    <tr>
      <th>interactive</th>
      <td>
        <em>e.g., <code>$ ssh</code>,  <code>$ su -</code> or <code>$ zsh --login</code></em>
        <br/>
        <ol>
          <li><code>${ZDOTDIR:-~}/.zprofile</code></li>
          <li><code>${ZDOTDIR:-~}/.zshrc</code></li>
        </ol>
      </td>
      <td>
        <em>e.g., <code>$ zsh</code></em>
        <br/>
        <code>${ZDOTDIR:-~}/.zshrc</code>
      </td>
    </tr>
    <tr>
      <th>non-interactive</th>
      <td>
        <em>e.g., <code>$ ssh 'cmd'</code></em>
        <br/>
        <code>${ZDOTDIR:-~}/.zprofile</code>
      </td>
      <td>
        <em>e.g., running scripts</em>
      </td>
    </tr>
  </tbody>
</table>


## bash
See: `man bash` under [Invocation](https://linux.die.net/man/1/bash).

On system login: `$HOME/.profile`

<table>
  <tbody>
    <tr>
      <th></th>
      <th>login</th>
      <th>non-login</th>
    </tr>
    <tr>
      <th>interactive</th>
      <td>
        <em>e.g., <code>$ ssh</code>,  <code>$ su -</code> or <code>$ bash --login</code></em>
        <br/>
        First one found of:
        <ol>
          <li><code>~/.bash_profile</code></li>
          <li><code>~/.bash_login</code></li>
          <li><code>~/.profile</code></li>
        </ol>
      </td>
      <td>
        <em>e.g., <code>$ bash</code></em>
        <br/>
        <code>~/.bashrc</code>
      </td>
    </tr>
    <tr>
      <th>non-interactive</th>
      <td>
        <em>e.g., <code>$ ssh 'cmd'</code></em>
        <br/>
        First one found of:
        <ol>
          <li><code>~/.bash_profile</code></li>
          <li><code>~/.bash_login</code></li>
          <li><code>~/.profile</code></li>
        </ol>
      </td>
      <td>
        <em>e.g., running scripts</em>
      </td>
    </tr>
  </tbody>
</table>

**Note:** When you want want your `.bashrc` sourced in login shells, you should create a `.bash_profile` that sources first `.profile` and then `.bashrc`.
Additionally, ensure that your `.bashrc` does nothing in non-interactive shells.

