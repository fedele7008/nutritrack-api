"""Create user table

Revision ID: 67e4d315aa58
Revises: 473d3a3a2dca
Create Date: 2023-06-05 15:06:01.404590

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '67e4d315aa58'
down_revision = '473d3a3a2dca'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('user',
                    sa.Column('id', sa.INTEGER(), nullable=False),
                    sa.Column('name', sa.String(length=255), nullable=True),
                    sa.Column('password', sa.String(
                        length=255), nullable=True),
                    sa.Column('email', sa.String(length=255), nullable=True),
                    sa.PrimaryKeyConstraint('id')
                    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('user')
    # ### end Alembic commands ###