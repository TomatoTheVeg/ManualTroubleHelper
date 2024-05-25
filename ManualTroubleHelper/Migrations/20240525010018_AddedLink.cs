using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ManualTroubleHelper.Migrations
{
    /// <inheritdoc />
    public partial class AddedLink : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Link",
                table: "Steps",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Link",
                table: "Steps");
        }
    }
}
