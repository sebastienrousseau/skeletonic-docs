"""Distutils module."""
from distutils.core import setup

setup(name='leaf',
      version='4.1.2',
      url='https://github.com/vapor/leaf',
      author='tanner0101',
      author_email='me@tanner.xyz',
      packages=['leaf'],
      entry_points="""
      [pygments.lexers]
      leaf = leaf.lexer:LeafLexer
      """,
)
