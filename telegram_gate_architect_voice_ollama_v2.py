import os
from telegram import Update
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes
from mistral_interface import query_mistral
from dotenv import load_dotenv

load_dotenv('.env')

BOT_TOKEN = os.getenv("TELEGRAM_BOT_TOKEN")
AUTHORIZED_USER_ID = int(os.getenv("AUTHORIZED_USER_ID"))
MISTRAL_API_URL = os.getenv("MISTRAL_API_URL")

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    if update.effective_user.id != AUTHORIZED_USER_ID:
        await context.bot.send_message(chat_id=update.effective_chat.id, text="⛔️ Access denied.")
        return
    await context.bot.send_message(chat_id=update.effective_chat.id, text="✅ Архітектор активний.")

app = ApplicationBuilder().token(BOT_TOKEN).build()
app.add_handler(CommandHandler("start", start))

if __name__ == "__main__":
    app.run_webhook(
        listen="0.0.0.0",
        port=8080,
        webhook_url=os.getenv("WEBHOOK_URL")
    )